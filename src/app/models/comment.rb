class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :replies, foreign_key: 'comment_id', dependent: :destroy
end
