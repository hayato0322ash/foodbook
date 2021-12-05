class RenameBussinessColumnToShops < ActiveRecord::Migration[6.1]
  def change
    rename_column :shops, :bussiness_hour, :business_hour
  end
end
