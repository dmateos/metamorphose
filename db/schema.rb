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

ActiveRecord::Schema.define(version: 20150311141821) do

  create_table "endpoints", force: :cascade do |t|
    t.integer  "flow_id",    limit: 4
    t.string   "data",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "flows", force: :cascade do |t|
    t.integer  "connector_type", limit: 4
    t.integer  "pipe_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pipes", force: :cascade do |t|
    t.integer  "out",        limit: 4
    t.integer  "in_type",    limit: 4
    t.integer  "out_type",   limit: 4
    t.string   "in_options", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transforms", force: :cascade do |t|
    t.integer  "pipe_id",        limit: 4
    t.integer  "transform_type", limit: 4
    t.string   "parameters",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
