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

ActiveRecord::Schema.define(version: 20140827085742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: true do |t|
    t.string  "name"
    t.string  "styles", default: [], array: true
    t.integer "year"
  end

  create_table "bands_musicians", id: false, force: true do |t|
    t.integer "band_id",     null: false
    t.integer "musician_id", null: false
    t.string  "position"
  end

  create_table "concerts", force: true do |t|
    t.date     "date"
    t.time     "hour"
    t.string   "place"
    t.text     "additional_info"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments", force: true do |t|
    t.string "name"
  end

  create_table "instruments_musicians", id: false, force: true do |t|
    t.integer "musician_id",   null: false
    t.integer "instrument_id", null: false
  end

  create_table "musicians", force: true do |t|
    t.string "username"
    t.string "email"
    t.string "position"
    t.string "first_name"
    t.string "last_name"
    t.date   "birth_date"
    t.string "aliases",         default: [], array: true
    t.string "password_digest"
  end

  add_index "musicians", ["username"], name: "index_musicians_on_username", using: :btree

end
