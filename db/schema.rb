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

ActiveRecord::Schema.define(version: 20180211115129) do

  create_table "designs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                                  null: false
    t.string   "name",                                     null: false
    t.boolean  "enable_cut",               default: false, null: false
    t.integer  "print_type",                               null: false
    t.string   "design_original_filename",                 null: false
    t.string   "design_file",                              null: false
    t.boolean  "active",                   default: false, null: false
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "material_type"
    t.text     "description",     limit: 65535
    t.boolean  "enable_cut",                    default: false, null: false
    t.integer  "print_type",                                    null: false
    t.integer  "price"
    t.integer  "provide_status",                                null: false
    t.integer  "active"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                       null: false
    t.integer  "product_id",                    null: false
    t.string   "title",                         null: false
    t.text     "comment",         limit: 65535
    t.string   "recipient_name",                null: false
    t.string   "tel",                           null: false
    t.integer  "postal_code",                   null: false
    t.string   "address_1",                     null: false
    t.string   "address_2",                     null: false
    t.integer  "shipping_type",                 null: false
    t.integer  "progress",                      null: false
    t.boolean  "active"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "design_id"
    t.integer  "material_id"
    t.string   "name"
    t.text     "description",             limit: 65535
    t.string   "image_original_filename"
    t.string   "image"
    t.string   "url"
    t.integer  "price"
    t.integer  "sale_status"
    t.boolean  "active"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.integer  "active"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
