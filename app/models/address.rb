class Address < ApplicationRecord
  belongs_to :end_user
  acts_as_paranoid

  validates :zipcode, :address, :name, presence: true

  def input_view_address
    zipcode.to_s.insert(3, '-').split('-')
    "〒" + self.zipcode + " " +self.address + " " + self.name.to_s
  end
  
end
