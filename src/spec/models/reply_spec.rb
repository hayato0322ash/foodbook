require 'rails_helper'

RSpec.describe Reply, type: :model do
  let!(:reply) { create :reply }
  describe '正常動作チェック' do
    context 'user_idとcomment_idが存在している場合' do
      it 'リプライは有効である' do
        expect(reply.valid?).to eq true
      end
    end
  end
  describe 'エラーチェック' do
    context 'user_idが存在しない場合' do
      it 'リプライは無効である' do
        reply.user_id = nil
        expect(reply.valid?).to eq false
      end
    end
    context 'comment_idが存在しない場合' do
      it 'リプライは無効である' do
        reply.comment_id = nil
        expect(reply.valid?).to eq false
      end
    end
    context 'contentが存在しない場合' do
      it 'リプライは無効である' do
        reply.content = ''
        expect(reply.valid?).to eq false
        expect(reply.errors[:content]).to include('を入力してください')
      end
    end
  end
end
