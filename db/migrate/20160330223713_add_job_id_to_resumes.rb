class AddJobIdToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :job_id, :integer
  end
end
