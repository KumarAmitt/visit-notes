# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_30_175954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.bigint "patient_id", null: false
    t.bigint "sub_goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id", "sub_goal_id"], name: "index_comments_on_patient_id_and_sub_goal_id", unique: true
    t.index ["patient_id"], name: "index_comments_on_patient_id"
    t.index ["sub_goal_id"], name: "index_comments_on_sub_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "title"
    t.string "goal_type"
    t.string "more_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_goals_on_title", unique: true
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plan_of_cares", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_plan_of_cares_on_goal_id"
    t.index ["patient_id", "goal_id"], name: "index_plan_of_cares_on_patient_id_and_goal_id", unique: true
    t.index ["patient_id"], name: "index_plan_of_cares_on_patient_id"
  end

  create_table "pronunciations", force: :cascade do |t|
    t.string "trials"
    t.string "prompting_level"
    t.bigint "patient_id", null: false
    t.bigint "word_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id", "word_id"], name: "index_pronunciations_on_patient_id_and_word_id", unique: true
    t.index ["patient_id"], name: "index_pronunciations_on_patient_id"
    t.index ["word_id"], name: "index_pronunciations_on_word_id"
  end

  create_table "sub_goals", force: :cascade do |t|
    t.string "title"
    t.bigint "goal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_sub_goals_on_goal_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.bigint "sub_goal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_goal_id"], name: "index_words_on_sub_goal_id"
  end

  add_foreign_key "comments", "patients"
  add_foreign_key "comments", "sub_goals"
  add_foreign_key "plan_of_cares", "goals"
  add_foreign_key "plan_of_cares", "patients"
  add_foreign_key "pronunciations", "patients"
  add_foreign_key "pronunciations", "words"
  add_foreign_key "sub_goals", "goals"
  add_foreign_key "words", "sub_goals"
end
