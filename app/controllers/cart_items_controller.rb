class CartItemsController < ApplicationController
  before_action :authenticate_end_user!

  def index
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

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    if @cart_item.save
      redirect_to cart_items_path, notice: "商品をカートに追加しました"
    else
      render :show
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_cart_items = CartItem.where(end_user_id: current_end_user.id)
    current_cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :material_id, :ribbon_id, :size)
  end
end
