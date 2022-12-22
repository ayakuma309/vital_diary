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

ActiveRecord::Schema.define(version: 2022_12_22_110515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vital_id", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["vital_id"], name: "index_comments_on_vital_id"
  end

  create_table "defecations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "vital_id"], name: "index_defecations_on_user_id_and_vital_id", unique: true
    t.index ["user_id"], name: "index_defecations_on_user_id"
    t.index ["vital_id"], name: "index_defecations_on_vital_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "gender"
    t.integer "blood_type"
    t.date "birthday"
    t.float "weight"
    t.text "important_term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vitals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "temperature", null: false
    t.integer "high_bp", null: false
    t.integer "low_bp", null: false
    t.integer "pulse", null: false
    t.integer "oxygen_saturation", null: false
    t.datetime "day", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vitals_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "vitals"
end
