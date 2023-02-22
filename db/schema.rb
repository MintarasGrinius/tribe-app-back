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

ActiveRecord::Schema.define(version: 2022_01_29_115757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_details", force: :cascade do |t|
    t.bigint "capacity"
    t.text "description"
    t.string "dress_code"
    t.boolean "own_drinks"
    t.string "location"
    t.datetime "time"
    t.string "title"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.text "age_group"
    t.index ["event_id"], name: "index_event_details_on_event_id"
  end

  create_table "event_users", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "organizer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.index ["event_id"], name: "index_events_users_on_event_id"
    t.index ["user_id"], name: "index_events_users_on_user_id"
  end

  create_table "hidden_event_details", force: :cascade do |t|
    t.bigint "event_id"
    t.string "contact_email"
    t.string "contact_phone"
    t.string "precise_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_hidden_event_details_on_event_id", unique: true
  end

  create_table "organizer_details", force: :cascade do |t|
    t.string "kind"
    t.string "name"
    t.bigint "organizer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "contact_phone"
    t.string "contact_email"
    t.index ["organizer_id"], name: "index_organizer_details_on_organizer_id", unique: true
  end

  create_table "organizer_settings", force: :cascade do |t|
    t.bigint "organizer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organizer_id"], name: "index_organizer_settings_on_organizer_id", unique: true
  end

  create_table "organizers", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_organizers_on_users_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "storage_url"
    t.string "photoable_type"
    t.bigint "photoable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["photoable_type", "photoable_id"], name: "index_photos_on_photoable"
  end

  create_table "qr_codes", force: :cascade do |t|
    t.string "code"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_qr_codes_on_event_id"
    t.index ["user_id"], name: "index_qr_codes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.decimal "score"
    t.text "review"
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
  end

  create_table "social_profiles", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "sociable_type"
    t.bigint "sociable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sociable_type", "sociable_id"], name: "index_social_profiles_on_sociable"
  end

  create_table "user_details", force: :cascade do |t|
    t.date "date_of_birth"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "confirmation_status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_details_on_user_id", unique: true
  end

  create_table "user_settings", force: :cascade do |t|
    t.string "location"
    t.integer "radius"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_settings_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
