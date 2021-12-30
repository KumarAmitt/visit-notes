class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.references :patient, null: false, foreign_key: true
      t.references :sub_goal, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:patient_id, :sub_goal_id], unique: true
  end
end
