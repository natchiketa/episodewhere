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

ActiveRecord::Schema.define(version: 20150703201928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer  "sequence"
    t.string   "title"
    t.string   "prod_code"
    t.string   "plot"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id", using: :btree

  create_table "script_beat_characters", force: :cascade do |t|
    t.integer  "script_beat_id"
    t.integer  "character_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "script_beat_characters", ["character_id"], name: "index_script_beat_characters_on_character_id", using: :btree
  add_index "script_beat_characters", ["script_beat_id"], name: "index_script_beat_characters_on_script_beat_id", using: :btree

  create_table "script_beats", force: :cascade do |t|
    t.integer  "start_line"
    t.integer  "beat_type"
    t.string   "content"
    t.integer  "episode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "script_beats", ["episode_id"], name: "index_script_beats_on_episode_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.integer  "sequence"
    t.integer  "tv_show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seasons", ["tv_show_id"], name: "index_seasons_on_tv_show_id", using: :btree

  create_table "tv_shows", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "episodes", "seasons"
  add_foreign_key "script_beat_characters", "characters"
  add_foreign_key "script_beat_characters", "script_beats"
  add_foreign_key "script_beats", "episodes"
  add_foreign_key "seasons", "tv_shows"
end
