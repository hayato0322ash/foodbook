require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment) { create :comment }

  context 'menu_idとuser_idとcontentが存在する場合' do
    it 'コメントは有効である' do
      expect(comment.valid?).to eq true
    end
  end
  context 'menu_idが存在しない場合' do
    it 'コメントは無効である' do
      comment.menu_id = nil
      expect(comment.valid?).to eq false
    end
  end

  context 'user_idが存在しない場合' do
    it 'コメントは無効である' do
      comment.user_id = nil
      expect(comment.valid?).to eq false
    end
  end

  context 'contentが存在しない場合' do
    it 'コメントは無効である' do
      comment.content = ''
      expect(comment.valid?).to eq false
      expect(comment.errors[:content]).to include('を入力してください')
    end
  end
end
