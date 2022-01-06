class Menu < ApplicationRecord
  has_many :comments, foreign_key: 'menu_id', dependent: :destroy
  has_many :likes, foreign_key: 'menu_id', dependent: :destroy
  has_many :favorites, foreign_key: 'menu_id', dependent: :destroy
  belongs_to :shop
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :evaluation, presence: true
  validates :category_id, presence: true
  validates :limited, inclusion: [true, false]

  # carrierwave画像アップロード用
  mount_uploader :image, ImageUploader
end
