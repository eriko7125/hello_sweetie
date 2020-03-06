class Order < ApplicationRecord
  belongs_to :end_user
  has_many   :order_details, dependent: :destroy
  
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  after_update do
    if self.status == "入金待ち"
      self.order_details.each {|order_detail| order_detail.update(production_status: "着手不可")}
    end

    if self.status == "入金確認"
      self.order_details.each {|order_detail| order_detail.update(production_status: "製作待ち")}
    end
  end
end
