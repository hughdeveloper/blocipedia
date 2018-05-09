class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false, default: ""
    add_column :users, :role, :integer, default: 0
    add_index :users, :username, unique: true
  end
end
