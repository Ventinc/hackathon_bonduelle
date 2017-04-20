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

ActiveRecord::Schema.define(version: 20170420070802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crops", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.datetime "harvest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "field_id"
    t.index ["field_id"], name: "index_crops_on_field_id", using: :btree
  end

  create_table "fields", force: :cascade do |t|
    t.float  "longitude"
    t.float  "latitude"
    t.string "name"
  end

  create_table "humidities", force: :cascade do |t|
    t.float    "value"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "date"
    t.integer  "parcel_id"
    t.index ["parcel_id"], name: "index_humidities_on_parcel_id", using: :btree
  end

  create_table "interventions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "parcel_id"
    t.integer  "crop_id"
    t.index ["crop_id"], name: "index_interventions_on_crop_id", using: :btree
    t.index ["parcel_id"], name: "index_interventions_on_parcel_id", using: :btree
  end

  create_table "owners", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "phone"
    t.integer "field_id"
    t.index ["field_id"], name: "index_owners_on_field_id", using: :btree
  end

  create_table "parcels", force: :cascade do |t|
    t.integer "field_id"
    t.index ["field_id"], name: "index_parcels_on_field_id", using: :btree
  end

  create_table "weathers", force: :cascade do |t|
    t.string   "description"
    t.float    "temperature"
    t.float    "humidity"
    t.float    "pressure"
    t.float    "wind_speed"
    t.float    "wind_dir"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "field_id"
    t.index ["field_id"], name: "index_weathers_on_field_id", using: :btree
  end

  add_foreign_key "crops", "fields"
  add_foreign_key "humidities", "parcels"
  add_foreign_key "interventions", "crops"
  add_foreign_key "interventions", "parcels"
  add_foreign_key "owners", "fields"
  add_foreign_key "parcels", "fields"
  add_foreign_key "weathers", "fields"
end
