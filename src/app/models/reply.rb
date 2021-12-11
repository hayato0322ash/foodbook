class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :menu
end
