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

ActiveRecord::Schema.define(version: 20161112202111) do

  create_table "campaign_finance_infos", force: :cascade do |t|
    t.integer  "filer_id",         limit: 4
    t.integer  "report_type_id",   limit: 4
    t.integer  "candidate_id",     limit: 4
    t.integer  "treasurer_id",     limit: 4
    t.integer  "election_type_id", limit: 4
    t.date     "sudmitdate"
    t.string   "filename",         limit: 4000
    t.string   "campaignyear",     limit: 4000
    t.boolean  "ontime"
    t.date     "periodbegin"
    t.date     "periodend"
    t.date     "electiondate"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "coh_payments", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.integer  "expend_category_id",       limit: 4
    t.integer  "prefix_id",                limit: 4
    t.integer  "entity_type_id",           limit: 4
    t.string   "businessname",             limit: 4000
    t.string   "address",                  limit: 4000
    t.string   "city",                     limit: 4000
    t.integer  "state_id",                 limit: 4
    t.string   "zip",                      limit: 4000
    t.float    "amount"
    t.date     "date"
    t.text     "description",              limit: 2147483647
    t.boolean  "isbenefitcoh"
    t.boolean  "istraveloutsidetx"
    t.boolean  "isaustintxlivingexpense"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "contribution_types", force: :cascade do |t|
    t.string   "contype",    limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.integer  "contribution_type_id",     limit: 4
    t.integer  "prefix_id",                limit: 4
    t.integer  "entity_type_id",           limit: 4
    t.string   "contributorname",          limit: 4000
    t.string   "address",                  limit: 4000
    t.string   "city",                     limit: 4000
    t.integer  "state_id",                 limit: 4
    t.string   "zip",                      limit: 4000
    t.float    "amount"
    t.date     "date"
    t.text     "description",              limit: 2147483647
    t.boolean  "isoutofstatepac"
    t.string   "pacid",                    limit: 4000
    t.boolean  "istraveloutsidetx"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "credits", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.integer  "prefix_id",                limit: 4
    t.integer  "entity_type_id",           limit: 4
    t.string   "creditorname",             limit: 4000
    t.string   "address",                  limit: 4000
    t.string   "city",                     limit: 4000
    t.integer  "state_id",                 limit: 4
    t.string   "zip",                      limit: 4000
    t.float    "amount"
    t.date     "date"
    t.text     "purpose",                  limit: 2147483647
    t.boolean  "isreturnedtofiler"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "entity_types", force: :cascade do |t|
    t.string   "entype",     limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "expend_categories", force: :cascade do |t|
    t.string   "expendcat",  limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "expend_types", force: :cascade do |t|
    t.string   "exptype",    limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "expenditures", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.integer  "expend_type_id",           limit: 4
    t.integer  "expend_category_id",       limit: 4
    t.integer  "payment_method_id",        limit: 4
    t.integer  "prefix_id",                limit: 4
    t.integer  "entity_type_id",           limit: 4
    t.string   "contributorname",          limit: 4000
    t.string   "address",                  limit: 4000
    t.string   "city",                     limit: 4000
    t.integer  "state_id",                 limit: 4
    t.string   "zip",                      limit: 4000
    t.float    "amount"
    t.date     "date"
    t.text     "description",              limit: 2147483647
    t.boolean  "isbenefitCOH"
    t.boolean  "istraveloutsidetx"
    t.boolean  "isreimbursementintended"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "investment_purchases", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.integer  "prefix_id",                limit: 4
    t.integer  "entity_type_id",           limit: 4
    t.string   "investorname",             limit: 4000
    t.string   "address",                  limit: 4000
    t.string   "city",                     limit: 4000
    t.integer  "state_id",                 limit: 4
    t.string   "zip",                      limit: 4000
    t.float    "amount"
    t.date     "date"
    t.text     "description",              limit: 2147483647
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.integer  "prefix_id",                limit: 4
    t.integer  "entity_type_id",           limit: 4
    t.string   "lendername",               limit: 4000
    t.string   "address",                  limit: 4000
    t.string   "city",                     limit: 4000
    t.integer  "state_id",                 limit: 4
    t.string   "zip",                      limit: 4000
    t.boolean  "isfinancialinstitution"
    t.boolean  "isoutofstatpac"
    t.string   "pacid",                    limit: 4000
    t.float    "amount"
    t.float    "interestrate"
    t.date     "date"
    t.date     "maturitydate"
    t.text     "collateraldescription",    limit: 2147483647
    t.boolean  "ispersonalfunddeposit"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "paymentmethod", limit: 4000
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "prefixes", force: :cascade do |t|
    t.string   "prefix",     limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "state",      limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
