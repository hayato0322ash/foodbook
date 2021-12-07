class Menu < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true
  validates :price, presence: true
  validates :evaluation, presence: true
end
