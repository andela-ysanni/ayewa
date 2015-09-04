class RemoveColumnFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :image_id, :string
  end
end
