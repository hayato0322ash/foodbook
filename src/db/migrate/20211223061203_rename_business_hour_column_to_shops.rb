class RenameBusinessHourColumnToShops < ActiveRecord::Migration[6.1]
  def change
    rename_column :shops, :business_hour, :open_hour
  end
end
