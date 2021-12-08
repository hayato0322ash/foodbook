class Menu < ApplicationRecord
  belongs_to :shop
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :evaluation, presence: true
end
