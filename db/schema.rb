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

ActiveRecord::Schema.define(version: 20150210230316) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible"
    t.date     "date"
    t.string   "author"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "price"
    t.date     "startDate"
    t.date     "endDate"
    t.string   "itinerary"
    t.integer  "nights"
    t.integer  "productType"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "itinerary_image_file_name"
    t.string   "itinerary_image_content_type"
    t.integer  "itinerary_image_file_size"
    t.datetime "itinerary_image_updated_at"
    t.integer  "user_id"
    t.boolean  "visible"
    t.string   "boatName"
    t.string   "boatLink"
    t.string   "cruise_image_file_name"
    t.string   "cruise_image_content_type"
    t.integer  "cruise_image_file_size"
    t.datetime "cruise_image_updated_at"
    t.string   "hotelName"
    t.string   "hotelLink"
    t.string   "hotel_image_file_name"
    t.string   "hotel_image_content_type"
    t.integer  "hotel_image_file_size"
    t.datetime "hotel_image_updated_at"
    t.string   "excursions"
    t.string   "flightName"
    t.string   "flightFrom"
    t.string   "flightTo"
    t.string   "video_Link"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "fullname"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
