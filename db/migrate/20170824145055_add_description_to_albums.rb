class AddDescriptionToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :description, :string
  end
end
