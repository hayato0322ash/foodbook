class RenameUserIdColumnToMenus < ActiveRecord::Migration[6.1]
  def change
    rename_column :menus, :user_id, :shop_id
  end
end
