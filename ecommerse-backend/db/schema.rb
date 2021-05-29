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

ActiveRecord::Schema.define(version: 2021_05_29_100342) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "pincode"
    t.string "line1"
    t.string "line2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catalogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "store_owner_id", null: false
    t.index ["store_owner_id"], name: "index_catalogs_on_store_owner_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "send_user_id"
    t.integer "receiver_user_id"
    t.bigint "quotation_request_id"
    t.index ["quotation_request_id"], name: "index_comments_on_quotation_request_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "licence_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "lite_licence_id", null: false
    t.bigint "catalog_id", null: false
    t.index ["catalog_id"], name: "index_licence_items_on_catalog_id"
    t.index ["lite_licence_id"], name: "index_licence_items_on_lite_licence_id"
  end

  create_table "lite_licences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id", null: false
    t.bigint "store_owner_id", null: false
    t.datetime "expiry_date"
    t.index ["customer_id"], name: "index_lite_licences_on_customer_id"
    t.index ["store_owner_id"], name: "index_lite_licences_on_store_owner_id"
  end

  create_table "order_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "purchase_id", null: false
    t.bigint "catalog_id", null: false
    t.index ["catalog_id"], name: "index_order_items_on_catalog_id"
    t.index ["purchase_id"], name: "index_order_items_on_purchase_id"
  end

  create_table "pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "number"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_purchases_on_customer_id"
    t.index ["number"], name: "index_purchases_on_number", unique: true
  end

  create_table "quotation_requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id", null: false
    t.bigint "store_owner_id", null: false
    t.index ["customer_id"], name: "index_quotation_requests_on_customer_id"
    t.index ["store_owner_id"], name: "index_quotation_requests_on_store_owner_id"
  end

  create_table "quote_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "quantity"
    t.float "price"
    t.float "quote_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "quotation_request_id", null: false
    t.bigint "order_item_id", null: false
    t.index ["order_item_id"], name: "index_quote_items_on_order_item_id"
    t.index ["quotation_request_id"], name: "index_quote_items_on_quotation_request_id"
  end

  create_table "store_owners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_store_owners_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "login_id"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
  end

  create_table "workflows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "status"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "workable_type", null: false
    t.bigint "workable_id", null: false
    t.index ["workable_type", "workable_id"], name: "index_workflows_on_workable_type_and_workable_id"
  end

  add_foreign_key "catalogs", "store_owners"
  add_foreign_key "comments", "quotation_requests"
  add_foreign_key "customers", "users"
  add_foreign_key "licence_items", "catalogs"
  add_foreign_key "licence_items", "lite_licences"
  add_foreign_key "lite_licences", "customers"
  add_foreign_key "lite_licences", "store_owners"
  add_foreign_key "order_items", "catalogs"
  add_foreign_key "order_items", "purchases"
  add_foreign_key "purchases", "customers"
  add_foreign_key "quote_items", "order_items"
  add_foreign_key "quote_items", "quotation_requests"
  add_foreign_key "store_owners", "users"
end
