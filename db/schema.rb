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

ActiveRecord::Schema.define(version: 20140725214858) do

  create_table "batting_statistics", force: true do |t|
    t.integer  "g"
    t.integer  "ab"
    t.integer  "r"
    t.integer  "h"
    t.integer  "double"
    t.integer  "triple"
    t.integer  "hr"
    t.integer  "rbi"
    t.integer  "sb"
    t.integer  "cs"
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_teams", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "player_id"
    t.integer  "birth_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["player_id"], name: "index_players_on_player_id"

  create_table "stats", force: true do |t|
    t.integer  "player_id"
    t.integer  "year"
    t.integer  "team_id"
    t.integer  "batting_statistic_id"
    t.integer  "pitching_statistic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "league"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
