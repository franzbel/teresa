class CreateJobVacancies < ActiveRecord::Migration
  def change
    create_table :job_vacancies do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :state
      t.string :education
      t.integer :years_of_experience

      t.timestamps null: false
    end
  end
end
