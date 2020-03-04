class OrderDetail < ApplicationRecord
  belongs_to :order

  enum production_status: { "着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }


  after_update do
    order_details = self.order.order_details
    if order_details.any? {|order_detail| order_detail.production_status == "製作中"} == true
      self.order.update(status: "製作中")
    else order_details.all? {|order_detail| order_detail.production_status == "製作完了"} == true
      self.order.update(status: "発送準備中")
    end
  end
end
