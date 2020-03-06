class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = Item.where(genre_id: @genre)
    @items_page = Item.page(params[:page]).per(12).order('created_at DESC')
  end
end
