class Ribbon < ApplicationRecord
  has_many :cart_items
  validates :color, presence:true
  validates :image, presence:true

  attachment :image

  enum status: { "無効": 0, "有効": 1 }
end
