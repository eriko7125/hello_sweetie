class Genre < ApplicationRecord
  has_many :items
  validates :name, presence:true

  enum status: { "無効": 0, "有効": 1 }

  #ジャンルが無効の場合アイテムを販売停止中にする
  after_update do
    if self.status == "無効"
      self.items.each {|item| item.update(status: "販売停止中")}
    else
      self.items.each {|item| item.update(status: "販売中")}
    end
  end
end
