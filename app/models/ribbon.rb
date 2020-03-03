class Ribbon < ApplicationRecord
  has_many :cart_items

  attachment :image

  #リボンステータスのenum管理
  enum status: { "無効": 0, "有効": 1 }

  #リボン色名、リボン画像の空欄登録を無効化
  validates :color, presence:true
  validates :image, presence:true
end
