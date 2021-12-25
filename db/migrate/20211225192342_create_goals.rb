class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :goal_type
      t.string :more_info

      t.timestamps
    end
  end
end
