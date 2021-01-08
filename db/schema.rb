# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_213244) do

  create_table "forms", force: :cascade do |t|
    t.text "name"
    t.integer "page_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_forms_on_page_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "item_type"
    t.text "iframe"
    t.integer "page_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_items_on_page_id"
  end

  create_table "locators", force: :cascade do |t|
    t.string "label"
    t.text "value"
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_locators_on_item_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "steps", force: :cascade do |t|
    t.text "item_name"
    t.text "action"
    t.integer "order_no"
    t.integer "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.index ["form_id"], name: "index_steps_on_form_id"
  end

  add_foreign_key "forms", "pages"
  add_foreign_key "items", "pages"
  add_foreign_key "locators", "items"
  add_foreign_key "steps", "forms"
end
