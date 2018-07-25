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

ActiveRecord::Schema.define(version: 2018_07_25_164757) do

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "user_id"
    t.integer "funding_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funding_project_id"], name: "index_comments_on_funding_project_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fp_creators", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "name_of_verified"
    t.boolean "verified?"
    t.text "creator_profile"
    t.datetime "last_logged_in"
    t.integer "fp_amt_created"
    t.integer "fp_amt_backed"
    t.string "creator_site"
    t.string "instagram_url"
    t.string "twitter_url"
    t.string "facebook_url"
    t.string "blog_url"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_project_categories", force: :cascade do |t|
    t.integer "funding_project_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "funding_goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "creator"
  end

  create_table "pledges", force: :cascade do |t|
    t.integer "amount"
    t.integer "user_id"
    t.integer "funding_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
