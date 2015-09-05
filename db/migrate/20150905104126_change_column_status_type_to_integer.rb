class ChangeColumnStatusTypeToInteger < ActiveRecord::Migration
  def change
    remove_column :listings, :status
    add_column :listings, :status, :integer, default: 0, null: false
  end
end
