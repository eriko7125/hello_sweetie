class Material < ApplicationRecord
  attachment :image

  #生地ステータスのenum管理
  enum status: { "無効": 0, "有効": 1 }

  #生地名、生地画像の空欄登録を無効化
  validates :name, presence:true
  validates :image, presence:true
end
