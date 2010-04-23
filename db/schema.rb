# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100423035847) do

  create_table "bought_stocks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.string   "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["locked_by"], :name => "index_delayed_jobs_on_locked_by"

  create_table "real_estates", :force => true do |t|
    t.integer  "user_id"
    t.string   "style"
    t.integer  "cashflow"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost"
  end

  create_table "stocks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "value"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "name"
    t.string   "job"
    t.integer  "job_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cash"
  end

end
