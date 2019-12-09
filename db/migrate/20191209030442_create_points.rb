class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.string :en_name
      t.integer :point

      t.timestamps
    end
  end
end
