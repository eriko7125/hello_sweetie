class OrdersController < ApplicationController
  def input_address
    @address = Address.new
  end

  def create_address
  address = Address.new(address_params)
  address.end_user_id = current_end_user.id
  if address.save
    redirect_to orders_input_address_path, success: "【配送先を登録しました】"
  else
    @address = Address.new
    render :input_address
  end
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

    if params[:select].present?
      redirect_to orders_display_path
    else
      redirect_to orders_input_address_path, danger: "【配送先を選択してください】"
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
    order.shipping_price = 830
    order.payment_price = order.sum_price + order.shipping_price
    order.save!
    
    current_cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = order.id
      @order_detail.item_name = cart_item.item.name
      @order_detail.material_name = cart_item.material.name
      @order_detail.ribbon_color = cart_item.ribbon.color
      @order_detail.size = cart_item.size
      @order_detail.price = cart_item.item.price
      @order_detail.production_status = 0
      @order_detail.save
    end
    
    current_cart_items.destroy_all
    session.delete(:zipcode)
    session.delete(:address)
    session.delete(:name)
    redirect_to orders_thanks_path, success: "【購入が完了しました】"
  end

  def display
    @order = Order.new
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_items_sum_price = 0
    @cart_items.each do |cart_item|
      @cart_items_sum_price += cart_item.item.price
    end
    @shipping_price = 830
  end

  def thanks
  end

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    
  end

  private

  def address_params
    params.require(:address).permit(:name, :zipcode, :address)
  end
end
