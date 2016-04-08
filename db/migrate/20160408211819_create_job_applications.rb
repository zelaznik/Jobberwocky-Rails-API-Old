class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.references :company, index: true
      t.references :user, index: true
      t.string :job_title
      t.string :url
      t.date :first_applied
      t.date :last_update
      t.references :status, index: true

      t.timestamps
    end
  end
end
