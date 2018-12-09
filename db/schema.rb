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

ActiveRecord::Schema.define(version: 2018_12_09_111456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_groups", force: :cascade do |t|
    t.text "name"
    t.integer "year"
    t.integer "number_in_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "student_id"
    t.string "grade"
    t.text "www"
    t.text "area_for_development"
    t.text "dirt"
    t.text "spelling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "homework_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.integer "class_group_id"
    t.date "date"
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_worksheet"
    t.text "misconception"
  end

  create_table "presentation_items", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "heading"
  end

  create_table "presentations", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "presentation_item_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.integer "class_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_current", default: true
  end

end
