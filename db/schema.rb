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

ActiveRecord::Schema.define(:version => 20120924095755) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.integer  "account_owner_id"
    t.string   "plan"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "phone"
    t.string   "email"
    t.text     "address"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "follow_ups", :force => true do |t|
    t.text     "comment"
    t.integer  "issue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "follow_ups", ["issue_id"], :name => "index_follow_ups_on_issue_id"

  create_table "issue_recipients", :force => true do |t|
    t.integer  "issue_id"
    t.integer  "user_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "issue_recipients", ["contact_id"], :name => "index_issue_recipients_on_contact_id"
  add_index "issue_recipients", ["issue_id"], :name => "index_issue_recipients_on_issue_id"
  add_index "issue_recipients", ["user_id"], :name => "index_issue_recipients_on_user_id"

  create_table "issues", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "issue_type"
    t.integer  "assigned_to_id"
    t.datetime "closed_at"
    t.integer  "todo_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "project_id"
    t.integer  "created_by_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "location"
    t.text     "professional_bio"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
  end

  add_index "profiles", ["name"], :name => "index_profiles_on_name"

  create_table "projects", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "job_number", :default => "", :null => false
    t.integer  "created_by"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "team_id"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "dept_no"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "account_id"
  end

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  add_index "teams_users", ["team_id", "user_id"], :name => "by_team_and_user", :unique => true

  create_table "todolists", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "project_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "todos", :force => true do |t|
    t.string   "name"
    t.boolean  "focused"
    t.integer  "created_by_id"
    t.integer  "assigned_to_id"
    t.integer  "todolist_id"
    t.datetime "scheduled"
    t.datetime "completed_at"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
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
