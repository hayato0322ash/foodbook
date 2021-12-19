require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create :user }
  describe '正常動作チェック' do
    it 'ユーザー一覧ページのリクエストが正常に動作する' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it 'ユーザー新規登録ページのリクエストが正常に動作する' do
      get new_user_path
      expect(response).to have_http_status(200)
    end
    it 'ログイン画面のリクエストが正常に動作する' do
      get login_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'エラーチェック' do
  end
end
