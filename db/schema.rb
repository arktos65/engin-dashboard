# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_06_224257) do

  create_table "currencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "exchange_rate", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "division"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "role_id", null: false
    t.bigint "department_id", null: false
    t.bigint "source_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_active"
    t.boolean "is_contractor"
    t.string "jira_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_members_on_department_id"
    t.index ["jira_account_id"], name: "index_members_on_jira_account_id", unique: true
    t.index ["role_id"], name: "index_members_on_role_id"
    t.index ["source_id"], name: "index_members_on_source_id"
  end

  create_table "resource_rates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "currency_id", null: false
    t.date "period_start"
    t.date "period_end"
    t.integer "classification", default: 0
    t.integer "rate_type", default: 0
    t.decimal "base_rate", precision: 10, default: "0"
    t.decimal "weekly_rate", precision: 10, default: "0"
    t.decimal "monthly_rate", precision: 10, default: "0"
    t.decimal "annual_rate", precision: 10, default: "0"
    t.integer "fiscal_year"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_resource_rates_on_currency_id"
    t.index ["member_id"], name: "index_resource_rates_on_member_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "is_shared"
    t.boolean "is_administration"
    t.bigint "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_roles_on_department_id"
  end

  create_table "sources", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "contact_title"
    t.string "contact_phone"
    t.string "contact_email"
    t.boolean "is_internal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "members", "departments"
  add_foreign_key "members", "roles"
  add_foreign_key "members", "sources"
  add_foreign_key "resource_rates", "currencies"
  add_foreign_key "resource_rates", "members"
end
