class AddColumnCloseHourToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :close_hour, :time
  end
end
