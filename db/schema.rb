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

ActiveRecord::Schema.define(version: 20150824115220) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "mail"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_translations", force: :cascade do |t|
    t.integer  "item_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "item_translations", ["item_id"], name: "index_item_translations_on_item_id"
  add_index "item_translations", ["locale"], name: "index_item_translations_on_locale"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.string   "hummingbird_url"
    t.string   "official_url"
    t.date     "airing_from"
    t.integer  "season_id"
    t.string   "category"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "content"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id"

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "alert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "season_id"
  end

  create_table "season_translations", force: :cascade do |t|
    t.integer  "season_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "notice"
  end

  add_index "season_translations", ["locale"], name: "index_season_translations_on_locale"
  add_index "season_translations", ["season_id"], name: "index_season_translations_on_season_id"

  create_table "seasons", force: :cascade do |t|
    t.string   "title"
    t.string   "notice"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
