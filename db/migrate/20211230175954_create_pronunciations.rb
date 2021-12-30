class CreatePronunciations < ActiveRecord::Migration[7.0]
  def change
    create_table :pronunciations do |t|
      t.string :trials
      t.string :prompting_level
      t.references :patient, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true

      t.timestamps
    end
    add_index :pronunciations, [:patient_id, :word_id], unique: true
  end
end
