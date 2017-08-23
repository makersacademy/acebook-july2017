class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hometown, :string
    add_column :users, :occupation, :string
    add_column :users, :bio, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
  end
end
