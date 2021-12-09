class AddColumnMenuIdToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :menu_id, :integer
  end
end
