require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user_a) { create :user }
  let!(:user_b) { create :user, email: 'hayato.drsp@gmail.com' }

  # let(:user_b) { create(:user) }
  describe '正常動作チェック' do
    context '名前、メールアドレス、パスワード(確認含む)、性別、誕生日を入力した場合' do
      it '有効アカウントである' do
        expect(user_a).to be_valid
      end
    end
    context 'アカウントがすでに存在している場合' do
      it '名前を変更できる' do
        user_a = build :user, name: '緋村抜刀斎'
        expect(user_a.name).to eq '緋村抜刀斎'
      end
      it 'メールアドレスを変更できる' do
        user_a = build :user, email: 'battousai@gmail.com'
        expect(user_a.email).to eq 'battousai@gmail.com'
      end
      it 'アカウントを削除できる' do
        expect do
          user_a.destroy
        end.to change(User, :count).by(-1)
      end
    end
  end

  describe 'エラーチェック' do
    context '名前を入力しない場合' do
      it 'アカウントは無効である' do
        user_a = build :user, name: ''
        user_a.valid?
        expect(user_a.errors[:name]).to include('を入力してください')
      end
    end

    context '名前が20文字以上の場合' do
      it 'アカウントは無効である' do
        user_a = build :user, name: 'a' * 21
        user_a.valid?
        expect(user_a.errors[:name]).to include('は20文字以内で入力してください')
      end
    end

    context 'メールアドレスを入力しない場合' do
      it 'アカウントは無効である' do
        user_a = build :user, email: ''
        user_a.valid?
        expect(user_a.errors[:email]).to include('を入力してください')
      end
    end

    context 'メールアドレスが他アカウントと重複している場合' do
      it 'アカウントは無効である' do
        user_a = build :user, email: 'hayato.drsp@gmail.com'
        user_a.valid?
        expect(user_a.errors[:email]).to include('はすでに存在します')
      end
    end

    context 'パスワードを入力しない場合' do
      it 'アカウントは無効である' do
        user_a = build :user, password: ''
        user_a.valid?
        expect(user_a.errors[:password]).to include('を入力してください')
      end
    end

    context 'パスワードが6文字以下の場合' do
      it 'アカウントは無効である' do
        user_a = build :user, password: 'a' * 5
        user_a.valid?
        expect(user_a.errors[:password]).to include('は6文字以上で入力してください')
      end
    end

    context 'パスワードとパスワード確認が一致しない場合' do
      it 'アカウントは無効である' do
        user_a = build :user, password: 'h03220322', password_confirmation: 'hayato0322'
        user_a.valid?
        expect(user_a.errors[:password_confirmation]).to include('とPasswordの入力が一致しません')
      end
    end

    context '性別を入力しない場合' do
      it 'アカウントは無効である' do
        user_a.sex = ''
        user_a.valid?
        expect(user_a.errors[:sex]).to include('を入力してください')
      end
    end

    context '誕生日を入力しない場合' do
      it 'アカウントは無効である' do
        user_a = build :user, birthday: ''
        user_a.valid?
        expect(user_a.errors[:birthday]).to include('を入力してください')
      end
    end

    context '管理者権限が存在しなかった場合' do
      it 'アカウントは無効である' do
        user_a = build :user, admin: nil
        user_a.valid?
        expect(user_a.errors[:admin]).to include('は一覧にありません')
      end
    end
  end
end
