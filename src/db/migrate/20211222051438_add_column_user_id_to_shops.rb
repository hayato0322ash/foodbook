class AddColumnUserIdToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :user_id, :integer
  end
end
