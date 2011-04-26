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

ActiveRecord::Schema.define(:version => 20110426114650) do

  create_table "invoices", :force => true do |t|
    t.integer  "client_id"
    t.integer  "number"
    t.string   "title"
    t.string   "attn"
    t.string   "address_1"
    t.string   "address_2"
    t.text     "description"
    t.integer  "net_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer "invoice_id"
    t.string  "name"
    t.decimal "cost",       :precision => 8, :scale => 2, :default => 0.0
    t.integer "position",                                 :default => 0
  end

end
