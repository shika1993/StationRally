class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.string :en_name
      t.integer :passenger
      t.integer :points
      t.timestamps
    end
  end
end
