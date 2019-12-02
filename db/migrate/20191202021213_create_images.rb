class CreateImages < ActiveRecord::Migration[5.0]
  def create
    create_table :images do |t|
      t.string :image, null: false
      t.string :text
      t.references :user_id, null: false, unique: true, foreign_key: true
      t.references :station_id, null: false, unique: true, foreign_key: true, index: true
      t.timestamps
    end
  end
end
