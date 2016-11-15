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

ActiveRecord::Schema.define(version: 20161115163353) do

  create_table "address_types", force: :cascade do |t|
    t.string   "adtype",     limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "state_id",        limit: 4
    t.integer  "address_type_id", limit: 4
    t.string   "address",         limit: 4000
    t.string   "suiteapt",        limit: 4000
    t.string   "city",            limit: 4000
    t.string   "zipcode",         limit: 4000
    t.boolean  "addresschange"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "campaign_finance_infos", force: :cascade do |t|
    t.integer  "filer_id",          limit: 4
    t.integer  "report_type_id",    limit: 4
    t.integer  "candidate_id",      limit: 4
    t.integer  "treasurer_id",      limit: 4
    t.integer  "election_type_id",  limit: 4
    t.date     "sudmitdate"
    t.string   "filename",          limit: 4000
    t.string   "campaignyear",      limit: 4000
    t.boolean  "ontime"
    t.date     "periodbegin"
    t.date     "periodend"
    t.date     "electiondate"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "noticecheck"
    t.boolean  "contributioncheck"
    t.boolean  "expenditurecheck"
    t.boolean  "loancheck"
    t.boolean  "paytocohcheck"
    t.boolean  "creditcheck"
    t.boolean  "travelcheck"
    t.integer  "user_id",           limit: 4
    t.boolean  "investmentcheck"
  end

  create_table "candidates", force: :cascade do |t|
    t.integer  "filer_id",         limit: 4
    t.integer  "prefix_id",        limit: 4
    t.integer  "office_held_id",   limit: 4
    t.integer  "office_sought_id", limit: 4
    t.string   "firstname",        limit: 4000
    t.string   "lastname",         limit: 4000
    t.string   "mi",               limit: 4000
    t.string   "alias",            limit: 4000
    t.string   "suffix",           limit: 4000
    t.string   "phone",            limit: 4000
    t.string   "extension",        limit: 4000
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

  create_table "committee_notices", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.integer  "committee_type_id",        limit: 4
    t.string   "name",                     limit: 4000
    t.string   "address",                  limit: 4000
    t.string   "city",                     limit: 4000
    t.integer  "state_id",                 limit: 4
    t.string   "zip",                      limit: 4000
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "committee_types", force: :cascade do |t|
    t.string   "comtype",    limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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

  create_table "election_types", force: :cascade do |t|
    t.string   "ectype",     limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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

  create_table "filer_types", force: :cascade do |t|
    t.string   "ftype",      limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "filers", force: :cascade do |t|
    t.integer  "filer_type_id",     limit: 4
    t.string   "firstname",         limit: 4000
    t.string   "mi",                limit: 4000
    t.string   "lastname",          limit: 4000
    t.string   "committeename",     limit: 4000
    t.string   "phone",             limit: 4000
    t.string   "extension",         limit: 4000
    t.boolean  "releasepassword"
    t.string   "releasepasswordto", limit: 4000
    t.string   "emailpasswordto",   limit: 4000
    t.boolean  "signature"
    t.integer  "office_held_id",    limit: 4
    t.integer  "office_sought_id",  limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "form_types", force: :cascade do |t|
    t.string   "formtype",   limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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
    t.string   "guarantor",                limit: 4000
    t.float    "amountguaranteed"
  end

  create_table "office_helds", force: :cascade do |t|
    t.string   "held",       limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "office_soughts", force: :cascade do |t|
    t.string   "sought",     limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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

  create_table "report_types", force: :cascade do |t|
    t.string   "rptype",     limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "state",      limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "travels", force: :cascade do |t|
    t.integer  "campaign_finance_info_id", limit: 4
    t.string   "name",                     limit: 4000
    t.integer  "form_type_id",             limit: 4
    t.date     "travelbegin"
    t.date     "travelend"
    t.integer  "prefix_id",                limit: 4
    t.string   "travelername",             limit: 4000
    t.string   "departureloc",             limit: 4000
    t.string   "destinationloc",           limit: 4000
    t.string   "transportation",           limit: 4000
    t.text     "purpose",                  limit: 2147483647
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "treasurers", force: :cascade do |t|
    t.integer  "prefix_id",  limit: 4
    t.string   "firstname",  limit: 4000
    t.string   "mi",         limit: 4000
    t.string   "lastname",   limit: 4000
    t.string   "alias",      limit: 4000
    t.string   "suffix",     limit: 4000
    t.string   "phone",      limit: 4000
    t.string   "extension",  limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               limit: 4000, default: "", null: false
    t.string   "encrypted_password",  limit: 4000, default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 4000
    t.string   "last_sign_in_ip",     limit: 4000
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
