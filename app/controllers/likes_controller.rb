class LikesController < ApplicationController
  def create
    like = Like.create(end_user_id: current_end_user.id, item_id: params[:item_id])
    @item = Item.find(params[:item_id])
  end

  def destroy
    like = Like.find_by(end_user_id: current_end_user.id, item_id: params[:item_id])
    like.destroy
    @item = Item.find(params[:item_id])
  end

  def index
    @likes = Like.where(end_user_id: current_end_user.id).page(params[:page]).per(12)
  end
end
