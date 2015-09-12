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

ActiveRecord::Schema.define(version: 20150912141655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.float    "summ",       default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "caption"
    t.datetime "time_start"
    t.datetime "time_finish"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "upper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menus", ["upper_id"], name: "index_menus_on_upper_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "count",      default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price",        default: 0.0
    t.text     "caption"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "menu_id"
    t.string   "image"
    t.boolean  "availability", default: true
  end

  add_index "products", ["name"], name: "index_products_on_name", using: :btree

end
