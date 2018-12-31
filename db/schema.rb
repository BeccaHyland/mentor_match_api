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

ActiveRecord::Schema.define(version: 2018_12_31_165748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "city"
    t.string "state"
    t.string "slack_username"
    t.boolean "matched", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true, null: false
    t.string "pronouns"
    t.string "current_title"
    t.string "current_employer"
    t.string "industries", default: [], array: true
    t.text "background"
    t.string "ways_to_mentor", default: [], array: true
    t.string "expertise_tech", default: [], array: true
    t.string "expertise_non_tech", default: [], array: true
    t.integer "mentee_capacity"
    t.string "country", default: "US"
    t.string "stack_preference", default: "no preference"
    t.string "identity_preference", default: [], array: true
    t.string "meeting_location", default: [], array: true
  end

  create_table "student_mentors", force: :cascade do |t|
    t.bigint "mentor_id"
    t.bigint "student_id"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_student_mentors_on_mentor_id"
    t.index ["student_id"], name: "index_student_mentors_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "pronouns"
    t.string "email"
    t.string "slack_username"
    t.boolean "matched", default: false, null: false
    t.boolean "active", default: true, null: false
    t.text "background"
    t.string "industries", default: [], array: true
    t.string "stack"
    t.string "identity_marker", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "student_mentors", "mentors"
  add_foreign_key "student_mentors", "students"
end
