class ItemsController < ApplicationController
  def index
    @items = Item.all
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

end
