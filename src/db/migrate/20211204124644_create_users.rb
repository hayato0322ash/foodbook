class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :sex
      t.integer :age

      t.timestamps
    end
  end
end
