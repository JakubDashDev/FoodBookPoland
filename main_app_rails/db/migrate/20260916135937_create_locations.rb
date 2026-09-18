class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.decimal :lat, null: false
      t.decimal :lng, null: false
      t.string :street, null: false
      t.string :postal_code
      t.string :city, null: false
      t.string :cuisine_type, null: false
      t.text :description, null: false
      t.string :google_maps_url

      t.index [:name, :street, :city], unique: true
      t.index :city

      t.timestamps
    end
  end
end
