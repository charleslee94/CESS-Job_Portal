class FixExipirationName < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.rename :exipiration, :expiration
    end
  end
end
