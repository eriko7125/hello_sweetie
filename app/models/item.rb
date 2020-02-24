class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items

  attachment :image

  #アイテムステータスのenum管理
  enum status: { "販売停止中": 0, "販売中": 1 }

  validates :name, presence:true
  validates :genre_id, presence:true, numericality: { only_integer: true }
  validates :status, presence:true
  validates :caption, presence:true
  validates :price, presence:true, numericality: { only_integer: true }
  validates :image, presence:true

end
