class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item), notice: "You have creatad item successfully."
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: "You have creatad item successfully."
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :caption, :status, :price, :image)
  end
end
