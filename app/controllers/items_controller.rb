class ItemsController < ApplicationController
  def index
    @genres = Genre.all
    # 販売中のアイテム
    @active_items = Item.where(status: 1).page(params[:page]).per(8).order('created_at DESC')
    # 販売停止中のアイテム
    @items = Item.where(status: 0).page(params[:page]).per(4).order('created_at DESC')
    # アイテム表示件数
    @item_count = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

    # status: 1 = 有効
    @active_materials = Material.where(status: 1)
    @active_ribbons = Ribbon.where(status: 1)
  end

end
