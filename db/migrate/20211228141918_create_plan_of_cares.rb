class CreatePlanOfCares < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_of_cares do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plan_of_cares, [:patient_id, :goal_id], unique: true
  end
end
