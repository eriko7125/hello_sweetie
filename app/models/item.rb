class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :likes, dependent: :destroy
  def like_user(end_user_id)
    likes.find_by(end_user_id: end_user_id)
  end

  validates :image, :name, :caption, :genre_id, presence:true
  validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角英数字で入力してください' } 
  validates :status, presence:true

  attachment :image

  enum status: { "販売停止中": 0, "販売中": 1 }
end
