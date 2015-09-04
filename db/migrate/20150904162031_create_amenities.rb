class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.references :listing, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
