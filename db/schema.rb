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

ActiveRecord::Schema.define(version: 20150614055119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "user_id"
    t.decimal  "price",                          precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_url",          limit: 255
    t.boolean  "active"
    t.boolean  "visible"
    t.text     "direct_image_url"
  end

  add_index "dishes", ["user_id"], name: "index_dishes_on_user_id", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type", limit: 255
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body"
    t.string   "subject",              limit: 255, default: ""
    t.integer  "sender_id"
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id"
    t.boolean  "draft",                            default: false
    t.string   "notification_code",    limit: 255
    t.integer  "notified_object_id"
    t.string   "notified_object_type", limit: 255
    t.string   "attachment",           limit: 255
    t.datetime "updated_at",                                       null: false
    t.datetime "created_at",                                       null: false
    t.boolean  "global",                           default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type",   limit: 255
    t.integer  "notification_id",                             null: false
    t.boolean  "is_read",                     default: false
    t.boolean  "trashed",                     default: false
    t.boolean  "deleted",                     default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "order_items", ["dish_id"], name: "index_order_items_on_dish_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "components"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.boolean  "completed"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "residences", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        limit: 255
    t.string   "encrypted_password",           limit: 255,                         default: "", null: false
    t.string   "reset_password_token",         limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",           limit: 255
    t.string   "last_sign_in_ip",              limit: 255
    t.string   "name",                         limit: 255
    t.string   "address",                      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home",                         limit: 255
    t.string   "lat",                          limit: 255
    t.string   "long",                         limit: 255
    t.string   "phone_number",                 limit: 255
    t.string   "customer_id",                  limit: 255
    t.string   "connect_id",                   limit: 255
    t.string   "secret_id",                    limit: 255
    t.string   "publishable_id",               limit: 255
    t.string   "currency",                     limit: 255
    t.string   "stripe_account_type",          limit: 255
    t.string   "stripe_user_id",               limit: 255
    t.string   "secret_key",                   limit: 255
    t.string   "publishable_key",              limit: 255
    t.string   "stripe_account_status",        limit: 255
    t.boolean  "transfers_enabled"
    t.string   "fb_hd_profile_picture",        limit: 255
    t.decimal  "lat_f",                                    precision: 9, scale: 6
    t.decimal  "long_f",                                   precision: 9, scale: 6
    t.string   "address_line_1",               limit: 255
    t.string   "address_line_2",               limit: 255
    t.string   "address_city",                 limit: 255
    t.string   "address_state",                limit: 255
    t.string   "address_zip",                  limit: 255
    t.string   "profile_picture_file_name",    limit: 255
    t.string   "profile_picture_content_type", limit: 255
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "prof_pic",                     limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "order_items", "dishes"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
