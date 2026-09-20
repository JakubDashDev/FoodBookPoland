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

ActiveRecord::Schema[7.1].define(version: 2026_09_20_092120) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["uuid"], name: "index_admin_users_on_uuid", unique: true
  end

  create_table "content_creators", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.jsonb "platforms", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_content_creators_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "lat", null: false
    t.decimal "lng", null: false
    t.string "street", null: false
    t.string "postal_code"
    t.string "city", null: false
    t.string "cuisine_type", null: false
    t.text "description", null: false
    t.string "google_maps_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_locations_on_city"
    t.index ["name", "street", "city"], name: "index_locations_on_name_and_street_and_city", unique: true
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.string "family_uuid", null: false
    t.string "token_digest", null: false
    t.datetime "used_at"
    t.datetime "expires_at", null: false
    t.bigint "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_refresh_tokens_on_admin_user_id"
    t.index ["family_uuid"], name: "index_refresh_tokens_on_family_uuid"
    t.index ["token_digest"], name: "index_refresh_tokens_on_token_digest", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "refresh_tokens", "admin_users"
end
