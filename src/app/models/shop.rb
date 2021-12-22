class Shop < ApplicationRecord
  has_many :menus, foreign_key: 'shop_id', dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :business_hour, presence: true
  validates :address, presence: true
end
