class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :replies, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  # validates :sex, presence: true
  validates :birthday, presence: true

  has_secure_password
end
