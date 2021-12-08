class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  # validates :sex, presence: true
  validates :birthday, presence: true
end
