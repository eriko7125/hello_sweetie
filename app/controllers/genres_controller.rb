class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = Item.where(genre_id: @genre)
    # @items = Item.page(params[:page]).per(12)
  end
end
