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

ActiveRecord::Schema.define(version: 20150617151716) do

  create_table "article_tweets", force: :cascade do |t|
    t.integer  "tweet_id",   limit: 8
    t.integer  "user_id",    limit: 8
    t.integer  "article_id"
    t.datetime "posted_at"
  end

  add_index "article_tweets", ["tweet_id"], name: "index_article_tweets_on_tweet_id"
  add_index "article_tweets", ["user_id", "article_id"], name: "index_article_tweets_on_user_id_and_article_id"
  add_index "article_tweets", ["user_id"], name: "index_article_tweets_on_user_id"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "thumbnail_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "rss_url"
  end

end
