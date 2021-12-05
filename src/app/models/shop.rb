class Shop < ApplicationRecord
  validates :name, presence: true
  validates :business_hour, presence: true
  validates :address, presence: true
end
