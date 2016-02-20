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

ActiveRecord::Schema.define(version: 20160220160922) do

  create_table "bcs", force: :cascade do |t|
    t.text     "description"
    t.string   "as_is_image"
    t.string   "to_be_image"
    t.integer  "request_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bcs", ["request_id"], name: "index_bcs_on_request_id"

  create_table "business_contexts", force: :cascade do |t|
    t.text     "description"
    t.string   "as_is_image"
    t.text     "as_is_description"
    t.string   "to_be_image"
    t.text     "to_be_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.text     "description"
    t.string   "owner"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "creation_date"
  end

end
