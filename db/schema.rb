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

ActiveRecord::Schema.define(version: 20141110004748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: true do |t|
    t.string   "provider",   default: "facebook"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices", force: true do |t|
    t.string   "value"
    t.text     "add_info"
    t.integer  "poll_id"
    t.string   "image_url"
    t.boolean  "yes"
    t.integer  "service_id"
    t.datetime "time"
  end

  create_table "events", force: true dos |t|
    t.boolean  "finished",        default: false
    t.integer  "user_id"
    t.integer  "service_id"
    t.string   "name"
    t.text     "desc"
    t.string   "start_time"
    t.string   "status",          default: "dormant"
    t.boolean  "complete",        default: false
    t.integer  "confirmation_id"
    t.string   "current_choice"
    t.integer  "threshold"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", force: true do |t|
    t.boolean "answered",     default: false
    t.string  "url"
    t.integer "event_id"
    t.string  "email"
    t.string  "phone_number"
    t.integer "user_id"
  end

  create_table "services", force: true do |t|
    t.string  "name"
    t.string  "image"
    t.string  "url"
    t.string  "img_ext",   default: "svg"
    t.boolean "available", default: true
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "school"
    t.string   "profile_pic_url"
    t.string   "fb_token"
    t.string   "activation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "phone_number"
    t.integer  "uu_id"
  end

end
