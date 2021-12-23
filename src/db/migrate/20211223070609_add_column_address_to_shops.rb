class AddColumnAddressToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :postcode, :integer
    add_column :shops, :prefecture_code, :integer
    add_column :shops, :address_city, :string
    add_column :shops, :address_street, :string
    add_column :shops, :address_building, :string
    remove_column :shops, :address
  end
end
