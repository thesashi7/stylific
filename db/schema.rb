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

ActiveRecord::Schema.define(version: 20141230220827) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "index"
    t.string   "create"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
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
    t.string   "phone_number"
    t.integer  "preference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "description"
    t.string   "tempInfo"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
  end

  create_table "hats", force: true do |t|
    t.integer  "price"
    t.integer  "total_quantity"
    t.string   "type_name"
    t.string   "company"
    t.string   "color"
    t.string   "image_path"
    t.string   "use_info"
    t.string   "special_info"
    t.string   "made_of"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style_name"
    t.string   "size"
  end

  create_table "jackets", force: true do |t|
    t.integer  "price"
    t.integer  "total_quantity"
    t.string   "type_name"
    t.string   "company"
    t.string   "color"
    t.string   "image_path"
    t.string   "use_info"
    t.string   "special_info"
    t.string   "made_of"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style_name"
    t.string   "size"
  end

  create_table "pants", force: true do |t|
    t.integer  "price"
    t.integer  "total_quantity"
    t.string   "type_name"
    t.string   "company"
    t.string   "color"
    t.string   "image_path"
    t.string   "use_info"
    t.string   "special_info"
    t.string   "made_of"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style_name"
    t.string   "size"
  end

  create_table "preferences", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "main_style"
    t.string   "jackets_ids"
    t.string   "pants_ids"
    t.string   "hats_ids"
    t.string   "shoes_ids"
  end

  create_table "shoes", force: true do |t|
    t.float    "price"
    t.integer  "total_quantity"
    t.string   "type_name"
    t.string   "company"
    t.string   "color"
    t.string   "image_path"
    t.string   "use_info"
    t.string   "special_info"
    t.string   "made_of"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style_name"
    t.string   "size"
  end

  create_table "stylists", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "expertise"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
