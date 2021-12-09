class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :replies, dependent: :destroy
end
