class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :idol_id
      t.integer :fan_id

      t.timestamps null: false
    end
    add_index :relationships, :idol_id
    add_index :relationships, :fan_id
    add_index :relationships, [:idol_id, :fan_id], unique: :true
  end
end
