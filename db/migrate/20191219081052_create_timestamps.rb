class CreateTimestamps < ActiveRecord::Migration[5.0]
  def change
    create_table :timestamps do |t|
      t.string :photograph_at
      t.timestamps
      t.references :image
    end
  end
end
