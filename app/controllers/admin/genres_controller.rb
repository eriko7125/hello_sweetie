class Admin::GenresController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path(@genres), notice: "【ジャンルを追加しました】"
    else
      @genres = Genre.all
      render action: :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "【ジャンルを変更しました】"
    else
      render action: :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name,:status)
  end
end
