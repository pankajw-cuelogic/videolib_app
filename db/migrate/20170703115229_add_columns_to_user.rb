class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :DOB, :date
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
