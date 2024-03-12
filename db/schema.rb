# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_12_042559) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "country_name"
    t.string "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "booking_histories", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "session_name"
    t.string "mentor_name"
    t.string "mentee_name"
    t.date "booking_date"
    t.time "booking_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_histories_on_booking_id"
  end

  create_table "booking_types", force: :cascade do |t|
    t.string "name"
    t.integer "minutes"
    t.integer "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "booking_type_id", null: false
    t.bigint "user_id", null: false
    t.string "book_user_name"
    t.string "book_user_email"
    t.text "introduction_text"
    t.integer "status"
    t.date "booking_date"
    t.string "session_name"
    t.time "booking_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_type_id"], name: "index_bookings_on_booking_type_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "review_text"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "social_links", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "icon"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.text "overview"
    t.integer "view_count"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "booking_histories", "bookings"
  add_foreign_key "bookings", "booking_types"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "social_links", "users"
end
