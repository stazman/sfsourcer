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

ActiveRecord::Schema.define(version: 2019_02_26_122804) do

  create_table "fp_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fp_creators", force: :cascade do |t|
    t.string "creator_name"
    t.string "location"
    t.text "creator_about"
    t.string "creator_site"
    t.string "email"
    t.string "instagram_url"
    t.string "twitter_url"
    t.string "facebook_url"
    t.string "blog_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_project_fp_creators", force: :cascade do |t|
    t.integer "funding_project_id"
    t.integer "fp_creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_project_pledges", force: :cascade do |t|
    t.integer "funding_project_id"
    t.integer "pledge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "funding_goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "l_stories", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lit_fan_authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lit_fan_genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lit_fan_work_lit_fan_genres", force: :cascade do |t|
    t.integer "lit_fan_genre_id"
    t.integer "lit_fan_work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lit_fan_genre_id"], name: "index_lit_fan_work_lit_fan_genres_on_lit_fan_genre_id"
    t.index ["lit_fan_work_id"], name: "index_lit_fan_work_lit_fan_genres_on_lit_fan_work_id"
  end

  create_table "lit_fan_works", force: :cascade do |t|
    t.string "title"
    t.integer "lit_fan_author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ls_comments", force: :cascade do |t|
    t.string "content"
    t.integer "ls_user_id"
    t.integer "l_story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ls_users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pledges", force: :cascade do |t|
    t.integer "amount"
    t.integer "fp_backer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "funding_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "fav_lits"
    t.string "fav_films"
    t.string "fav_games"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
  end

  create_table "wg_comments", force: :cascade do |t|
    t.string "author"
    t.text "content"
    t.integer "wg_work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wg_works", force: :cascade do |t|
    t.string "author"
    t.text "bio"
    t.string "title"
    t.string "version"
    t.text "content"
    t.integer "writer_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "writer_groups", force: :cascade do |t|
    t.string "wg_creator"
    t.string "wg_name"
    t.text "wg_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
