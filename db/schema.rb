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

ActiveRecord::Schema.define(version: 20180809220047) do

  create_table "boats", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "manufacturer"
    t.string   "model"
    t.integer  "year"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sailors", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "skipper"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "voyages", force: :cascade do |t|
    t.integer  "skipper_id"
    t.integer  "boat_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "crew"
    t.text     "initial_condition"
    t.text     "return_condition"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
