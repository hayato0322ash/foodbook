class AddColumnHeadlineToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :headline, :string
  end
end
