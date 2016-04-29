class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :mission, :text
    add_column :users, :num_students, :integer
    add_column :users, :num_staff, :integer
    add_column :users, :ratio, :string
    add_column :users, :special, :text
  end
end
