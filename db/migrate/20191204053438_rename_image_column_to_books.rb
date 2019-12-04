class RenameImageColumnToBooks < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :image, :picture
  end
end