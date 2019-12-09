class AddPointToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :en_name, :string
  end
end
