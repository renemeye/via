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

ActiveRecord::Schema.define(version: 2019_07_20_095407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equalities", force: :cascade do |t|
    t.string "tarif_point_name"
    t.integer "ibnr"
    t.string "equality_type"
    t.integer "min_km"
    t.string "price_forming_tarif_point_name"
    t.integer "price_forming_tarif_point_ibnr"
    t.string "collective_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plus_city_zones", force: :cascade do |t|
    t.string "dtzid"
    t.string "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public_transit_stations", force: :cascade do |t|
    t.string "dhid"
    t.string "dtzid"
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarif_distances", force: :cascade do |t|
    t.string "from_name"
    t.integer "from_ibnr"
    t.string "to_name"
    t.integer "to_ibnr"
    t.integer "tarif_kilometer"
    t.boolean "bus"
    t.boolean "around"
    t.boolean "exclusion_way"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarif_points", force: :cascade do |t|
    t.string "name"
    t.integer "ibnr"
    t.string "status"
    t.string "network"
    t.string "regions"
    t.boolean "equality_treatments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abbreviation"
    t.integer "eva_nr"
    t.string "ds100"
    t.string "dhid"
    t.float "latitude"
    t.float "longitude"
  end

end
