class AddFteToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :FTE, :string
  end
end
