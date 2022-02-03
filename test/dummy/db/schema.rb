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

ActiveRecord::Schema.define(version: 2022_02_03_030609) do

  create_table "nanpa_coc_central_office_codes", force: :cascade do |t|
    t.string "npa_nxx", limit: 6
    t.string "state", limit: 2
    t.string "rate_center"
    t.integer "ocn"
    t.string "company", null: false
    t.integer "initial_growth", limit: 1, null: false
    t.boolean "pooled", null: false
    t.boolean "in_service"
    t.date "effective_date"
    t.date "assign_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["npa_nxx"], name: "index_nanpa_coc_central_office_codes_on_npa_nxx", unique: true
  end

end
