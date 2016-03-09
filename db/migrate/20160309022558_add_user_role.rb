class AddUserRole < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: 10
  end
end
