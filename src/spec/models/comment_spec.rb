require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create :user }
  let!(:menu) { create :menu }
  let!(:comment) { create :comment }
  context 'menu_idとuser_idとcontentが存在する場合' do
    it 'コメントは有効である' do
      expect(comment).to eq('これはテストコードです')
    end
  end
end
