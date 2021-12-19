require 'rails_helper'

RSpec.describe Menu, type: :model do
  let!(:menu_a) { create :menu }
  describe '正常動作チェック' do
    context '商品名・価格・評価・店舗IDが存在している場合' do
      it 'メニューは有効である' do
        expect(menu_a).to be_valid
      end
    end

    context 'メニューがすでに存在している場合' do
      it 'メニュー名を変更できる' do
        menu_a.name = '世界一美味しいコーヒー'
        expect(menu_a.name).to eq '世界一美味しいコーヒー'
      end
      it '価格を変更できる' do
        menu_a.price = 50_000
        expect(menu_a.price).to eq 50_000
      end
      it 'メニューを削除できる' do
        expect do
          menu_a.destroy
        end.to change(Menu, :count).by(-1)
      end
    end

    context 'shop_idが存在すれば場合' do
      let!(:shop_a) { create :shop, name: 'テスト店' }
      it 'メニューは有効である' do
        menu_a.shop_id = shop_a.id
        expect(menu_a).to be_valid
      end
    end
  end

  describe 'エラーチェック' do
    context '商品名が存在しない場合' do
      it 'メニューは無効である' do
        menu_a.name = ''
        menu_a.valid?
        expect(menu_a.errors[:name]).to include('を入力してください')
      end
    end

    context '価格が存在しない場合' do
      it 'メニューは無効である' do
        menu_a.price = ''
        menu_a.valid?
        expect(menu_a.errors[:price]).to include('を入力してください')
      end
    end

    context '評価が存在しない場合' do
      it 'メニューは無効である' do
        menu_a.evaluation = ''
        menu_a.valid?
        expect(menu_a.errors[:evaluation]).to include('を入力してください')
      end
    end
  end
end
