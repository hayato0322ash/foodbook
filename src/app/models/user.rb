class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :replies, foreign_key: 'user_id', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', dependent: :destroy
  has_many :shops, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :sex, presence: true
  validates :birthday, presence: true
  validates :admin, inclusion: { in: [true, false] }

  has_secure_password
end
