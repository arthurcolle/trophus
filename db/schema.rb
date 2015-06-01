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

ActiveRecord::Schema.define(version: 20150601185731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: true do |t|
    t.string   "name",               limit: 20
    t.integer  "user_id"
    t.decimal  "price",                          precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",        limit: 150
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_url"
  end

  add_index "dishes", ["user_id"], name: "index_dishes_on_user_id", using: :btree

  create_table "residences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home"
    t.string   "lat"
    t.string   "long"
    t.string   "phone_number"
    t.string   "customer_id"
    t.string   "connect_id"
    t.string   "secret_id"
    t.string   "publishable_id"
    t.string   "currency"
    t.string   "stripe_account_type"
    t.string   "stripe_user_id"
    t.string   "secret_key"
    t.string   "publishable_key"
    t.string   "stripe_account_status"
    t.boolean  "transfers_enabled"
    t.string   "fb_hd_profile_picture"
    t.decimal  "lat_f",                  precision: 9, scale: 6
    t.decimal  "long_f",                 precision: 9, scale: 6
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
