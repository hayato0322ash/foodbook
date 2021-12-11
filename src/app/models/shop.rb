class Shop < ApplicationRecord
  has_many :menus, foreign_key: 'shop_id', dependent: :destroy

  validates :name, presence: true
  validates :business_hour, presence: true
  validates :address, presence: true
end
