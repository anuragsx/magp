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

ActiveRecord::Schema.define(version: 20150312065818) do

  create_table "article_files", force: true do |t|
    t.string   "article_file_file_name"
    t.string   "article_file_content_type"
    t.integer  "article_file_file_size"
    t.datetime "article_file_updated_at"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.string   "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "issue_id"
    t.text     "article_text"
    t.string   "editor"
    t.string   "contributor"
    t.string   "photographer"
    t.string   "main_contact"
    t.boolean  "copy_complete"
    t.boolean  "photo_complete"
    t.boolean  "print_ready"
    t.integer  "contact_id"
    t.string   "article_file_file_name"
    t.string   "article_file_content_type"
    t.integer  "article_file_file_size"
    t.datetime "article_file_updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "description"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
    t.integer  "user_id"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  create_table "issues", force: true do |t|
    t.text     "image"
    t.string   "pdf_file_name"
    t.string   "print_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.string   "pdf_file_name_file_name"
    t.string   "pdf_file_name_content_type"
    t.integer  "pdf_file_name_file_size"
    t.datetime "pdf_file_name_updated_at"
    t.integer  "magazine_id"
    t.string   "name"
  end

  create_table "magazines", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
