class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.date :start_date
      t.date :end_date
      t.string :degree_name
      t.string :school_name
      t.text :education_description
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
