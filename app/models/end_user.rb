class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

  acts_as_paranoid
  
  validates :last_name, :first_name, presence: true
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ｧ-ﾝﾞﾟ]+\z/, message: 'は半角ｶﾅで入力してください' } #半角ｶﾀｶﾅ
  validates :zipcode, format: { with: /\A\d{7}\z/, message: 'は7桁で入力してください'}  #半角英数字７桁
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁か11桁で入力してください' } #半角英数字10桁か11桁
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
