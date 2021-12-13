require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'a specification' do
    let!(:user_a) { create(:user) }
    let!(:user_b) { create(:user, email: 'hayato.drsp@gmail.com') }

    # let(:user_b) { create(:user) }

    context '名前、メールアドレス、パスワード(確認含む)、性別、誕生日が存在する場合' do
      it '有効アカウントである' do
        expect(user_a).to be_valid
      end
    end
    context '名前が存在しない場合' do
      it 'アカウントは無効である' do
        user_a = build(:user, name: '')
        expect(user_a).not_to be_valid
      end
    end

    context '名前が20文字以上の場合' do
      it 'アカウントは無効である' do
        user_a = build(:user, name: 'a' * 20)
        expect(user_a).not_to be_valid
      end
    end

    context 'メールアドレスが存在しない場合' do
      it 'アカウントは無効である' do
        user_a.email = ''
        expect(user_a).not_to be_valid
      end
    end

    context '重複しているメールアドレスの場合' do
      it 'アカウントは無効である' do
        user_b = build(:user, email: 'test@gmail.com')
        expect(user_b).not_to be_valid
      end
    end

    context 'パスワード(ハッシュ化済み)が存在しない場合' do
      it 'アカウントは無効である' do
        user_a = build(:user, password_digest: '')
        expect(user_a).not_to be_valid
      end
    end

    context 'パスワードが6文字以下の場合' do
      it 'アカウントは無効である' do
        user_a = build(:user, password: 'a' * 5)
        expect(user_a).not_to be_valid
      end
    end

    context '性別が存在しない場合' do
      it 'アカウントは無効である' do
        user_a.sex = ''
        expect(user_a).not_to be_valid
      end
    end

    context '誕生日が存在しない場合' do
      it 'アカウントは無効である' do
        user_a.birthday = ''
        expect(user_a).not_to be_valid
      end
    end
  end
end
