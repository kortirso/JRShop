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

ActiveRecord::Schema.define(version: 20151010150425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "summ",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "caption"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "link"
    t.boolean  "active",     default: true
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree

  create_table "managers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "upper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "link"
    t.string   "image"
  end

  add_index "menus", ["upper_id"], name: "index_menus_on_upper_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.string   "person"
    t.string   "phone"
    t.boolean  "get_by_self",   default: true
    t.text     "caption"
    t.boolean  "check_city"
    t.boolean  "check_factory"
    t.string   "address"
    t.integer  "summ"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "count",      default: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "beauty",     default: false
    t.boolean  "green",      default: false
    t.integer  "summ"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price",        default: 0
    t.text     "caption"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "menu_id"
    t.string   "image"
    t.boolean  "availability", default: true
    t.string   "link"
    t.integer  "sells",        default: 0
    t.boolean  "season",       default: false
  end

  add_index "products", ["name"], name: "index_products_on_name", using: :btree

end
