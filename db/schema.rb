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

ActiveRecord::Schema.define(version: 2022_03_01_040408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offer_histories", force: :cascade do |t|
    t.integer "offer_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["offer_id", "user_id"], name: "index_offer_histories_on_offer_id_and_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "count"
    t.integer "status"
    t.decimal "reward"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo"
    t.string "website"
  end

  create_table "recommend_projects", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "website"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_like_projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recommend_project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "recommend_project_id"], name: "index_user_like_projects_on_user_id_and_recommend_project_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
