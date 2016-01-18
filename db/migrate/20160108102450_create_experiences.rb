class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.date :start_date
      t.date :end_date
      t.string :job_title
      t.string :company_name
      t.text :job_description
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
