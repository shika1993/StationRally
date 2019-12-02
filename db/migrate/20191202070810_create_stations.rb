class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name, null: false, unique: true
      t.decimal :geolat, precision: 7, scale: 5
      t.decimal :geolong, precision: 8, scale: 5
      t.integer :point, null: false, default: 0
      t.timestamps
    end
  end
end
