class AddUserDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address, :text
    add_column :users, :phone_number, :string
    add_column :users, :status, :integer, default: 0
    add_column :users, :avatar, :string
  end
end
