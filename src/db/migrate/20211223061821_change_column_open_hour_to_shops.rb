class ChangeColumnOpenHourToShops < ActiveRecord::Migration[6.1]
  def change
    change_column :shops, :open_hour, :time
  end
end
