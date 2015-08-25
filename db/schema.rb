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

ActiveRecord::Schema.define(version: 20150825190237) do

  create_table "groups", force: :cascade do |t|
    t.string   "unique_id"
    t.string   "kind"
    t.string   "title"
    t.boolean  "isInstrumented"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "groups", ["kind"], name: "index_groups_on_kind"

  create_table "locations", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "latitude_delta"
    t.decimal  "longitude_delta"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "group_id"
  end

  add_index "locations", ["group_id"], name: "index_locations_on_group_id"

  create_table "spaces", force: :cascade do |t|
    t.integer  "policy"
    t.boolean  "metered"
    t.boolean  "instrumented"
    t.boolean  "creditcard"
    t.boolean  "coin"
    t.integer  "group_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "unique_id"
  end

  add_index "spaces", ["group_id"], name: "index_spaces_on_group_id"

end
