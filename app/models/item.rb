class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items

  validates :image, :name, :caption, :genre_id, presence:true
  validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角英数字で入力してください' } 
  validates :status, presence:true

  attachment :image

  enum status: { "販売停止中": 0, "販売中": 1 }
end
