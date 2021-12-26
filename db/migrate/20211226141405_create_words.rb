class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :name
      t.references :sub_goal, foreign_key: true

      t.timestamps
    end
  end
end
