require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:shop_a) { create :shop }
  let(:menu_a) { create :menu }

  context '商品名・価格・評価・店舗IDが存在している場合' do
    it 'メニューは有効である' do
      expect(menu_a).to be_valid
    end
  end

  context '商品名が存在しない場合' do
    it 'メニューは無効である' do
      menu_a = build :menu, name: ''
      expect(menu_a).not_to be_valid
    end
  end

  context '価格が存在しない場合' do
    it 'メニューは無効である' do
      menu_a = build :menu, price: ''
      expect(menu_a).not_to be_valid
    end
  end

  context '評価が存在しない場合' do
    it 'メニューは無効である' do
      menu_a = build :menu, evaluation: ''
      expect(menu_a).not_to be_valid
    end
  end
end
