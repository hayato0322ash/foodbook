class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :price
      t.integer :evaluation
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :menus, %i[shop_id created_at]
  end
end
