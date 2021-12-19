require 'rails_helper'

RSpec.describe Shop, type: :model do
  let!(:shop_a) { create :shop }
  let!(:shop_b) { create :shop, name: 'スターバックスコーヒー小平天神店' }
  context '店舗名・営業時間・店舗住所が存在する場合' do
    it '店舗登録は有効である' do
      expect(shop_a).to be_valid
    end
  end

  context '店舗名が存在しない場合' do
    it '店舗登録は無効である' do
      shop_a = build :shop, name: ''
      shop_a.valid?
      expect(shop_a.errors[:name]).to include('を入力してください')
    end
  end

  context '店舗名が他店舗と重複している場合' do
    it '店舗登録は無効である' do
      shop_a = build :shop, name: 'スターバックスコーヒー小平天神店'
      shop_a.valid?
      expect(shop_a.errors[:name]).to include('はすでに存在します')
    end
  end

  context '営業時間が存在しない場合' do
    it '店舗登録は無効である' do
      shop_a = build :shop, business_hour: ''
      shop_a.valid?
      expect(shop_a.errors[:business_hour]).to include('を入力してください')
    end
  end

  context '店舗住所が存在しない場合' do
    it '店舗登録は無効である' do
      shop_a = build :shop, address: ''
      shop_a.valid?
      expect(shop_a.errors[:address]).to include('を入力してください')
    end
  end
end
