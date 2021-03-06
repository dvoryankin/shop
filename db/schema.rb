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

ActiveRecord::Schema.define(version: 2018_07_24_124059) do

  create_table "carts", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts_items", id: false, force: :cascade do |t|
    t.integer "cart_id"
    t.integer "item_id"
    t.index ["cart_id", "item_id"], name: "index_carts_items_on_cart_id_and_item_id"
    t.index ["cart_id"], name: "index_carts_items_on_cart_id"
    t.index ["item_id", "cart_id"], name: "index_carts_items_on_item_id_and_cart_id"
    t.index ["item_id"], name: "index_carts_items_on_item_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "used", default: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "item_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id", "item_id"], name: "index_positions_on_cart_id_and_item_id"
    t.index ["cart_id"], name: "index_positions_on_cart_id"
    t.index ["item_id", "cart_id"], name: "index_positions_on_item_id_and_cart_id"
    t.index ["item_id"], name: "index_positions_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
