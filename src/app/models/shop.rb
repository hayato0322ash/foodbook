class Shop < ApplicationRecord
  has_many :menus, foreign_key: 'shop_id', dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :open_hour, presence: true
  validates :close_hour, presence: true

  # 住所入力関連
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
