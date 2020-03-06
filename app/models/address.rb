class Address < ApplicationRecord
  belongs_to :end_user
  
  # paranoia
  acts_as_paranoid

  validates :zipcode, format: { with: /\A\d{7}\z/, message: 'は7桁で入力してください'}
  validates :address, :name, presence: true

  def input_view_address
    zipcode.to_s.insert(3, '-').split('-')
    "〒" + self.zipcode + " " +self.address + " " + self.name.to_s
  end
end
