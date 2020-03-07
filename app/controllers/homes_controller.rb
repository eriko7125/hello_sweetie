class HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(4)
    @item_rank = Item.order(likes_count: :desc).limit(3)
  end

  def about
  end
end
