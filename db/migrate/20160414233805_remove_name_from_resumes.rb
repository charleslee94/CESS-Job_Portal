class RemoveNameFromResumes < ActiveRecord::Migration
  def change
    remove_column :resumes, :name, :string
  end
end
