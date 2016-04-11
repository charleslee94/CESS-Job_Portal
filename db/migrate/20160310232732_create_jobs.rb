class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :school
      t.string :title
      t.text :summary
      t.string :compensation_min
      t.string :compensation_max
      t.datetime :expiration

      t.timestamps null: false
    end
  end
end
