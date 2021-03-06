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

ActiveRecord::Schema.define(version: 20160219919105) do

  create_table "archives", force: :cascade do |t|
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
  end

  add_index "categories", ["section_id"], name: "index_categories_on_section_id"

  create_table "category_memberships", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_memberships", ["category_id"], name: "index_category_memberships_on_category_id"
  add_index "category_memberships", ["item_id"], name: "index_category_memberships_on_item_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "subdomain"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "text"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
  end

  add_index "menus", ["group_id"], name: "index_menus_on_group_id"

  create_table "sections", force: :cascade do |t|
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "template_id"
  end

  add_index "sections", ["template_id"], name: "index_sections_on_template_id"

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "subcategory_memberships", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "subcategory_memberships", ["item_id"], name: "index_subcategory_memberships_on_item_id"
  add_index "subcategory_memberships", ["subcategory_id"], name: "index_subcategory_memberships_on_subcategory_id"

  create_table "templates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "structure"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "menu_id"
  end

  add_index "templates", ["menu_id"], name: "index_templates_on_menu_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "slug"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
