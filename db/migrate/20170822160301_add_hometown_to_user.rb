class AddHometownToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hometown, :string
    add_column :users, :occupation, :string
    add_column :users, :bio, :string
  end
end
