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

ActiveRecord::Schema.define(version: 20170202202012) do

  create_table "brackets", force: :cascade do |t|
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_brackets_on_tournament_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "pool_id"
    t.integer  "bracket_id"
    t.integer  "away_id"
    t.integer  "home_id"
    t.integer  "court_id"
    t.integer  "ref_id"
    t.datetime "date"
    t.integer  "score_away"
    t.integer  "score_home"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["bracket_id"], name: "index_games_on_bracket_id"
    t.index ["pool_id"], name: "index_games_on_pool_id"
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
  end

  create_table "pools", force: :cascade do |t|
    t.integer  "tournament_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_pools_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "pool_id"
    t.string   "name"
    t.string   "email"
    t.float    "win_percentage"
    t.integer  "plus_minus"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["pool_id"], name: "index_teams_on_pool_id"
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "date"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tournaments_on_user_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
