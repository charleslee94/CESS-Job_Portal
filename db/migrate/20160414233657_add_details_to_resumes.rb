class AddDetailsToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :firstname, :string
    add_column :resumes, :lastname, :string
  end
end
