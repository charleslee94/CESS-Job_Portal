class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :jobs, :summary, :job_description
  end
end
