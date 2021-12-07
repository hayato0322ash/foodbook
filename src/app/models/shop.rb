class Shop < ApplicationRecord
  has_many :menus
  validates :name, presence: true
  validates :business_hour, presence: true
  validates :address, presence: true
end
