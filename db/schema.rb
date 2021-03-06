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

ActiveRecord::Schema.define(version: 2019_11_03_225726) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer "list_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categorizations_on_category_id"
    t.index ["list_id"], name: "index_categorizations_on_list_id"
  end

  create_table "credit_purchases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "credits"
    t.integer "paid_cents"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_purchases_on_user_id"
  end

  create_table "familial_list_relationships", force: :cascade do |t|
    t.integer "parent_list_id"
    t.integer "child_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_inclusion_sources", force: :cascade do |t|
    t.integer "list_inclusion_id"
    t.string "title"
    t.string "body"
    t.integer "person_id"
    t.datetime "posted_at"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_inclusion_id"], name: "index_list_inclusion_sources_on_list_inclusion_id"
    t.index ["person_id"], name: "index_list_inclusion_sources_on_person_id"
  end

  create_table "list_inclusions", force: :cascade do |t|
    t.integer "list_id"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "matched_text"
    t.integer "trigger_id"
    t.string "source_url"
    t.datetime "posted_at"
    t.string "trapped_text"
    t.datetime "flagged_invalid_at"
    t.index ["list_id"], name: "index_list_inclusions_on_list_id"
    t.index ["person_id"], name: "index_list_inclusions_on_person_id"
    t.index ["trigger_id"], name: "index_list_inclusions_on_trigger_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "user_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_tags", force: :cascade do |t|
    t.integer "person_id"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trigger_id"
    t.index ["person_id"], name: "index_person_tags_on_person_id"
    t.index ["trigger_id"], name: "index_person_tags_on_trigger_id"
  end

  create_table "triggers", force: :cascade do |t|
    t.string "name"
    t.string "pattern"
    t.integer "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "search_query"
    t.boolean "enabled", default: true
    t.float "confidence"
    t.string "user_tags_applied"
    t.index ["list_id"], name: "index_triggers_on_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "credits", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
