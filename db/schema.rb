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

ActiveRecord::Schema.define(version: 2018_12_02_184829) do

  create_table "photos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "place_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["place_id"], name: "index_photos_on_place_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.integer "number"
    t.string "district"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country", default: "Brasil"
    t.decimal "latitude", precision: 10, scale: 8
    t.decimal "longitude", precision: 10, scale: 8
    t.string "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.index ["latitude", "longitude"], name: "index_places_on_latitude_and_longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "place_id"
    t.text "comment"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_reviews_on_place_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
