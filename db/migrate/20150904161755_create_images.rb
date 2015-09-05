class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      # t.references :listing, index: true, foreign_key: true
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
