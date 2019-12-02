class CreateUsersStations < ActiveRecord::Migration[5.0]
  def change
    create_table :users_stations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
