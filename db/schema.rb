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

ActiveRecord::Schema.define(version: 2018_12_20_020517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentor_preferences", force: :cascade do |t|
    t.bigint "mentor_id"
    t.bigint "preference_id"
    t.index ["mentor_id"], name: "index_mentor_preferences_on_mentor_id"
    t.index ["preference_id"], name: "index_mentor_preferences_on_preference_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "city"
    t.string "state"
    t.string "slack_username"
    t.string "linkedin_username"
    t.string "github_username"
    t.boolean "matched", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "program"
    t.boolean "active", default: true, null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "mentor_preferences", "mentors"
  add_foreign_key "mentor_preferences", "preferences"
end
