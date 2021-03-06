# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180719100156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer "points", null: false
    t.boolean "attendance", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.integer "kind", default: 0, null: false
    t.index ["lesson_id"], name: "index_achievements_on_lesson_id"
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "topic", default: "", null: false
    t.string "summary"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "displayed", default: true, null: false
    t.bigint "group_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "number", null: false
    t.string "parallel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number", "parallel"], name: "index_groups_on_number_and_parallel", unique: true
  end

  create_table "hometasks", force: :cascade do |t|
    t.string "description", null: false
    t.string "link", default: "", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_hometasks_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "topic", default: "", null: false
    t.text "description", default: "", null: false
    t.text "links", default: "", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_lessons_on_theme_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "image", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "topic", default: "", null: false
    t.text "description", default: "", null: false
    t.text "links", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer "day", default: 0, null: false
    t.integer "number", default: 1, null: false
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["course_id"], name: "index_timeslots_on_course_id"
    t.index ["day", "number", "group_id"], name: "index_timeslots_on_day_and_number_and_group_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "role", default: 0, null: false
    t.boolean "approved", default: false, null: false
    t.integer "group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "achievements", "lessons"
  add_foreign_key "achievements", "users"
  add_foreign_key "hometasks", "lessons"
  add_foreign_key "lessons", "themes"
  add_foreign_key "timeslots", "courses"
end
