class OrdersController < ApplicationController
  def input_address
    @addresses = Address.all
    @address = Address.new
  end

  def create_address
    address = Address.new(address_params)
    address.end_user_id = current_end_user.id
    address.save
    redirect_to orders_input_address_path
  end

  def create_session
    # session
    if params[:select] == "main_address"
      session[:zipcode] = current_end_user.zipcode
      session[:address] = current_end_user.address
      session[:name] = "#{current_end_user.last_name} #{current_end_user.first_name}"
    elsif params[:select] == "sub_address"
      sub_address = Address.find(params[:sub_address_id])
      session[:zipcode] = sub_address.zipcode
      session[:address] = sub_address.address
      session[:name] = sub_address.name
    end
    
    if session[:address].present?
      redirect_to orders_display_path
    else
      render input_address
    end
  end

  def create
    order = Order.new
    order.end_user_id = current_end_user.id
    order.name = session[:name]
    order.zipcode = session[:zipcode]
    order.address = session[:address]
    order.status = 0
    cart_items_sum_price = 0
    current_cart_items = CartItem.where(end_user_id: current_end_user.id)
    current_cart_items.each do |cart_item|
      cart_items_sum_price += cart_item.item.price
    end
    order.sum_price = cart_items_sum_price
    order.shipping_price = 800
    order.payment_price = order.sum_price + order.shipping_price
    order.save
    
    current_cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_name = cart_item.item.name
      order_detail.material_name = cart_item.material.name
      order_detail.ribbon_color = cart_item.ribbon.color
      order_detail.size = cart_item.size
      order_detail.price = cart_item.item.price
      order_detail.production_status = 0
      order_detail.save
    end

    current_cart_items.destroy_all
    session.delete(:zipcode)
    session.delete(:address)
    session.delete(:name)
    redirect_to orders_thanks_path, notice: "購入が完了しました"
  end

  def display
    @order = Order.new
    @current_cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_items = []
    @current_cart_items.each do |cart_item|
      hash = { 
        cart_item: cart_item,
        material: Material.find(cart_item.material_id),
        ribbon: Ribbon.find(cart_item.ribbon_id)
      }
      @cart_items.push(hash)
    end

    @cart_items_sum_price = 0
    @current_cart_items.each do |cart_item|
      @cart_items_sum_price += cart_item.item.price
    end
    @shipping_price = 800
  end

  def thanks
    
  end

  
  def index
  end

  def show
  end

  private

  def address_params
    params.require(:address).permit(:name, :zipcode, :address)
  end

end
