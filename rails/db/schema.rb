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

ActiveRecord::Schema.define(version: 20141118182300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tokens", force: true do |t|
    t.string   "access_token"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_tokens", ["user_id"], name: "index_api_tokens_on_user_id", using: :btree

  create_table "journeys", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "journeys", ["user_id"], name: "index_journeys_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.integer  "journey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "venue_id"
  end

  add_index "locations", ["journey_id"], name: "index_locations_on_journey_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.text     "about"
    t.datetime "date_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "reputations", force: true do |t|
    t.integer  "up_votes"
    t.integer  "down_votes"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "journey_id"
    t.integer  "profile_id"
  end

  add_index "reputations", ["journey_id"], name: "index_reputations_on_journey_id", using: :btree
  add_index "reputations", ["profile_id"], name: "index_reputations_on_profile_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
