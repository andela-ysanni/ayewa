class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :location
      t.string :address
      t.references :amenities, index: true, foreign_key: true
      t.integer :status
      t.text :description
      t.integer :price
      t.references :user, index: true, foreign_key: true
      # t.references :image, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
