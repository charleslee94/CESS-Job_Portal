class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, :default => "candidate"
  end
end
