class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image, null: false, foreign_key: true
      t.string :text
      t.references :user, null: false, unique: true, foreign_key: true
      t.references :station, null: false, unique: true, foreign_key: true, index: true
      t.timestamps
    end
  end
end
