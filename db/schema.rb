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

ActiveRecord::Schema.define(version: 20171121181137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string  "name"
    t.integer "country_id"
    t.index ["country_id"], name: "index_clubs_on_country_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "region"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "team_id"
    t.integer "minute"
    t.integer "match_id"
    t.integer "player_id"
    t.index ["match_id"], name: "index_goals_on_match_id", using: :btree
    t.index ["player_id"], name: "index_goals_on_player_id", using: :btree
    t.index ["team_id"], name: "index_goals_on_team_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "seasons_tournaments_id"
    t.integer "seasons_tournament_id"
    t.index ["seasons_tournament_id"], name: "index_matches_on_seasons_tournament_id", using: :btree
    t.index ["seasons_tournaments_id"], name: "index_matches_on_seasons_tournaments_id", using: :btree
  end

  create_table "matches_players", id: false, force: :cascade do |t|
    t.integer "match_id"
    t.integer "player_id"
    t.index ["match_id"], name: "index_matches_players_on_match_id", using: :btree
    t.index ["player_id"], name: "index_matches_players_on_player_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string  "first_name"
    t.string  "middle_name"
    t.string  "last_name"
    t.integer "team_id"
    t.date    "born_date"
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.index ["player_id"], name: "index_players_teams_on_player_id", using: :btree
    t.index ["team_id"], name: "index_players_teams_on_team_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "start_year"
    t.integer "end_year"
    t.integer "season_type"
  end

  create_table "seasons_tournaments", force: :cascade do |t|
    t.integer "season_id"
    t.integer "tournament_id"
  end

  create_table "seasons_tournaments_teams", id: false, force: :cascade do |t|
    t.integer "team_id",                null: false
    t.integer "seasons_tournament_id",  null: false
    t.integer "seasons_tournaments_id"
    t.index ["seasons_tournaments_id"], name: "index_seasons_tournaments_teams_on_seasons_tournaments_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.integer "club_id"
    t.integer "season_id"
    t.index ["club_id"], name: "index_teams_on_club_id", using: :btree
    t.index ["season_id"], name: "index_teams_on_season_id", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "country_id"
    t.string  "name"
    t.integer "rank"
    t.string  "transfermarkt_name"
    t.string  "transfermarkt_division_name"
    t.index ["country_id"], name: "index_tournaments_on_country_id", using: :btree
  end

  add_foreign_key "goals", "matches"
  add_foreign_key "goals", "players"
  add_foreign_key "goals", "teams"
  add_foreign_key "matches", "seasons_tournaments"
  add_foreign_key "matches", "seasons_tournaments", column: "seasons_tournaments_id"
  add_foreign_key "matches_players", "matches"
  add_foreign_key "matches_players", "players"
  add_foreign_key "players_teams", "players"
  add_foreign_key "players_teams", "teams"
  add_foreign_key "seasons_tournaments_teams", "seasons_tournaments", column: "seasons_tournaments_id"
  add_foreign_key "teams", "clubs"
  add_foreign_key "teams", "seasons"
end
