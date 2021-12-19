require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe '新規登録テスト' do
    context '全て入力されている場合' do
      before do
        visit new_user_path
        expect(page).to have_content 'ユーザー新規登録'
        fill_in '名前', with: 'テスト野郎'
        fill_in 'メールアドレス', with: 'test2@gmail.com'
        fill_in 'パスワード', with: 'h03220322'
        fill_in 'パスワード確認', with: 'h03220322'
        select '男性', from: 'user[sex]'
        select '1990', from: 'user[birthday(1i)]'
        select '3', from: 'user[birthday(2i)]'
        select '22', from: 'user[birthday(3i)]'
      end
      it '新規登録完了される' do
        expect do
          click_button '登録する'
        end.to change(User, :count).by(1)
        user = User.find_by(name: 'テスト野郎')
        pp user
      end
    end
  end
end
