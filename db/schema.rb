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

ActiveRecord::Schema.define(version: 20150904183002) do

  create_table "amenities", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "amenities", ["listing_id"], name: "index_amenities_on_listing_id"

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["listing_id"], name: "index_images_on_listing_id"

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "address"
    t.integer  "amenities_id"
    t.integer  "status"
    t.text     "description"
    t.integer  "price"
    t.integer  "user_id"
    t.integer  "image_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "listings", ["amenities_id"], name: "index_listings_on_amenities_id"
  add_index "listings", ["image_id"], name: "index_listings_on_image_id"
  add_index "listings", ["user_id"], name: "index_listings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name"
    t.text     "address"
    t.string   "phone_number"
    t.integer  "status",          default: 0
    t.string   "avatar"
    t.string   "confirm_token"
  end

end
