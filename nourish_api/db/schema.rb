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

ActiveRecord::Schema[8.0].define(version: 2025_08_28_171824) do
  create_table "achievements", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "babies", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthdate"
    t.string "gender"
    t.index ["user_id"], name: "index_babies_on_user_id"
  end

  create_table "bottle_feeds", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "ounces"
    t.text "notes"
    t.integer "baby_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_bottle_feeds_on_baby_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "length"
    t.text "notes"
    t.integer "user_id", null: false
    t.integer "baby_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_feeds_on_baby_id"
    t.index ["user_id"], name: "index_feeds_on_user_id"
  end

  create_table "pumps", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "length"
    t.integer "ounces"
    t.text "notes"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pumps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "achievements", "users"
  add_foreign_key "babies", "users"
  add_foreign_key "bottle_feeds", "babies"
  add_foreign_key "feeds", "babies"
  add_foreign_key "feeds", "users"
  add_foreign_key "pumps", "users"
end
