class ItemsController < ApplicationController
  def index
    @items = Item.all.order(status: :desc)
    @items = Item.page(params[:page]).per(12)

    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

    # status: 1 = 有効
    @active_materials = Material.where(status: 1)
    @active_ribbons = Ribbon.where(status: 1)
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id
    if cart_item.save
      redirect_to cart_items_path(cart_item), notice: "商品をカートに追加しました"
    else
      render :show
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :material_id, :ribbon_id)
  end
end
