class RenameUrlToNameOnImages < ActiveRecord::Migration
  def change
    rename_column :images, :url, :name
  end
end
