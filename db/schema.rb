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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130522034616) do

  create_table "offers", :force => true do |t|
    t.integer  "person_id"
    t.integer  "school_id"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "offers", ["person_id", "school_id"], :name => "index_offers_on_person_id_and_school_id", :unique => true
  add_index "offers", ["person_id"], :name => "index_offers_on_person_id"
  add_index "offers", ["school_id"], :name => "index_offers_on_school_id"

  create_table "people", :force => true do |t|
    t.string  "name"
    t.integer "offers_count"
  end

  create_table "schools", :force => true do |t|
    t.integer "ranking"
    t.string  "name"
    t.string  "city"
    t.string  "state"
    t.decimal "lat"
    t.decimal "lon"
    t.string  "tuition"
    t.integer "enrollment"
    t.string  "accept_rate"
    t.string  "retention_rate"
    t.string  "graduation_rate"
    t.string  "group"
    t.integer "offers_count"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "name"
    t.integer  "class_id"
    t.string   "alt_email"
    t.string   "cell_cn"
    t.string   "cell_us"
    t.integer  "person_id"
    t.integer  "school_id"
    t.string   "skype"
    t.string   "facebook"
    t.text     "notes"
    t.boolean  "superuser",             :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
