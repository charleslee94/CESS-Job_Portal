class ChangeColumnName2 < ActiveRecord::Migration
  def change
    rename_column :jobs, :FTE, :fte
  end
end
