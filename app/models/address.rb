class Address < ApplicationRecord
  belongs_to :end_user
  acts_as_paranoid

  validates :zipcode, :address, :name, presence: true
end
