# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160330063932) do

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.string   "platform"
    t.string   "protocol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_contexts", force: :cascade do |t|
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "business_contexts", ["request_id"], name: "index_business_contexts_on_request_id"

  create_table "custom_headings", force: :cascade do |t|
    t.string   "header"
    t.text     "description"
    t.integer  "ch_context_id"
    t.string   "ch_context_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "flow_consumers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "actor_id"
    t.integer  "flow_id"
  end

  create_table "flow_providers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "actor_id"
    t.integer  "flow_id"
  end

  create_table "flows", force: :cascade do |t|
    t.string   "name"
    t.text     "objective"
    t.string   "size"
    t.string   "security"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "request_id"
    t.boolean  "master_data"
    t.string   "frequency"
  end

  add_index "flows", ["request_id"], name: "index_flows_on_request_id"

  create_table "headings", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "headerable_id"
    t.string   "headerable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "headings", ["headerable_type", "headerable_id"], name: "index_headings_on_headerable_type_and_headerable_id"

  create_table "owners", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.integer  "ownerable_id"
    t.string   "ownerable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "owners", ["ownerable_type", "ownerable_id"], name: "index_owners_on_ownerable_type_and_ownerable_id"

  create_table "ownerships", force: :cascade do |t|
    t.integer  "ownerable_id"
    t.string   "ownerable_type"
    t.integer  "owner_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "request_actors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "request_id"
    t.integer  "actor_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "owner"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "heading_id"
    t.string   "name"
  end

  add_index "uploads", ["heading_id"], name: "index_uploads_on_heading_id"

end
