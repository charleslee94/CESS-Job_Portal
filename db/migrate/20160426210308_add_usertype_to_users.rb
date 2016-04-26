class AddUsertypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :string, default: "candidate"
  end
end
