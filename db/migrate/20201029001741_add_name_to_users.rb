class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :cnpj, :string
    add_column :users, :main_phone_number, :string
    add_column :users, :secondary_phone_number, :string
    add_column :users, :main_address, :string
    add_column :users, :secondary_address, :string
  end
end
