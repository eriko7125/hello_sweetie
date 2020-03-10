class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    # 販売中のアイテム
    @active_items = Item.where(genre_id: @genre, status: 1).page(params[:page]).per(8).order('created_at DESC')
    # 販売停止中のアイテム
    @items = Item.where(genre_id: @genre, status: 0).page(params[:page]).per(4).order('created_at DESC')
    # アイテム件数表示
    @item_count = Item.where(genre_id: @genre)
  end
end