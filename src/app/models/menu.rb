class Menu < ApplicationRecord
  has_many :comments, foreign_key: 'menu_id', dependent: :destroy
  has_many :likes, foreign_key: 'menu_id', dependent: :destroy
  belongs_to :shop

  validates :name, presence: true
  validates :price, presence: true
  validates :evaluation, presence: true
end
