class Category < ApplicationRecord
  has_many :menus, foreign_key: 'category_id', dependent: :destroy
end
