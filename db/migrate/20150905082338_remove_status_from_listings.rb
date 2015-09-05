class RemoveStatusFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :status, :string
  end
end
