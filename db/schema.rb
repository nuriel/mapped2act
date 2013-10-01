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

ActiveRecord::Schema.define(:version => 20131001112937) do

  create_table "act_causes", :force => true do |t|
    t.integer  "act_id"
    t.integer  "cause_id"
    t.string   "message"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "act_causes", ["act_id"], :name => "index_act_causes_on_act_id"
  add_index "act_causes", ["cause_id"], :name => "index_act_causes_on_cause_id"

  create_table "acts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "presentation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cause_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "marker_address"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "causes", :force => true do |t|
    t.integer  "state"
    t.string   "name"
    t.string   "website"
    t.string   "phone"
    t.string   "email",               :limit => 50
    t.text     "social_contribution"
    t.string   "one_liner",           :limit => 100
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "logo"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "gmaps"
    t.integer  "cause_category_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
