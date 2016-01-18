class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :number
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
