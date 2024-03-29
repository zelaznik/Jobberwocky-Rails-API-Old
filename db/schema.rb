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

ActiveRecord::Schema.define(version: 20160703172747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "job_applications", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "job_title"
    t.string   "url"
    t.date     "first_applied"
    t.date     "last_update"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_applications", ["company_id"], name: "index_job_applications_on_company_id", using: :btree
  add_index "job_applications", ["status_id"], name: "index_job_applications_on_status_id", using: :btree
  add_index "job_applications", ["user_id"], name: "index_job_applications_on_user_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "placements", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 0
  end

  add_index "placements", ["order_id"], name: "index_placements_on_order_id", using: :btree
  add_index "placements", ["product_id"], name: "index_placements_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title",      default: ""
    t.decimal  "price",      default: 0.0
    t.boolean  "published",  default: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 0
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "statuses", force: true do |t|
    t.text     "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statuses", ["label"], name: "index_statuses_on_label", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token",             default: ""
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "auth_expires_at"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
