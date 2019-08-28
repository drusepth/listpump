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

ActiveRecord::Schema.define(version: 20190828063727) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_categorizations_on_category_id"
    t.index ["list_id"], name: "index_categorizations_on_list_id"
  end

  create_table "familial_list_relationships", force: :cascade do |t|
    t.integer  "parent_list_id"
    t.integer  "child_list_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "list_inclusions", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "person_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "matched_text"
    t.integer  "trigger_id"
    t.string   "source_url"
    t.datetime "posted_at"
    t.string   "trapped_text"
    t.datetime "flagged_invalid_at"
    t.index ["list_id"], name: "index_list_inclusions_on_list_id"
    t.index ["person_id"], name: "index_list_inclusions_on_person_id"
    t.index ["trigger_id"], name: "index_list_inclusions_on_trigger_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "triggers", force: :cascade do |t|
    t.string   "name"
    t.string   "pattern"
    t.integer  "list_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "search_query"
    t.boolean  "enabled",      default: true
    t.float    "confidence"
    t.index ["list_id"], name: "index_triggers_on_list_id"
  end

end
