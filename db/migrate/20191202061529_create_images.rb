class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.string :text
      t.references :user, unique: true
      t.references :station, unique: true, index: true
      t.timestamps
    end
  end
end
