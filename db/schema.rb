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

ActiveRecord::Schema.define(version: 20160114170917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text    "body"
    t.integer "deploy_id"
    t.integer "user_id"
  end

  create_table "deploys", force: :cascade do |t|
    t.string   "uid"
    t.string   "sha"
    t.string   "repository"
    t.string   "username"
    t.string   "project_uid"
    t.string   "environment"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: :cascade do |t|
    t.text     "message"
    t.string   "pivotal_uid"
    t.datetime "date"
    t.integer  "deploy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pull_request_uid"
    t.string   "title"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                default: "", null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "github_username"
    t.string   "pivotal_username"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
