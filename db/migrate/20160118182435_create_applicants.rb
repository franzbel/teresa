class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.references :job_vacancy, index: true, foreign_key: true
      t.integer :applicant_id

      t.timestamps null: false
    end
  end
end
