class AddColumnCategoryIdToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :category_id, :integer
  end
end
