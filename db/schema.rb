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

ActiveRecord::Schema.define(version: 20160729030035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "contact_number"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_companies_on_user_id", using: :btree
  end

  create_table "project_working_estimate_subworking_specialists", force: :cascade do |t|
    t.integer  "project_working_estimate_subworking_id"
    t.integer  "specialist_id"
    t.string   "specialist_name"
    t.integer  "specialist_rate"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["project_working_estimate_subworking_id"], name: "p_w_e_s", using: :btree
    t.index ["specialist_id"], name: "specialists_ind", using: :btree
  end

  create_table "project_working_estimate_subworkings", force: :cascade do |t|
    t.integer  "project_working_estimate_id"
    t.integer  "sub_working_id"
    t.string   "sub_working_title"
    t.string   "sub_working_hour"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["project_working_estimate_id"], name: "p_w_e", using: :btree
    t.index ["sub_working_id"], name: "s_w", using: :btree
  end

  create_table "project_working_estimates", force: :cascade do |t|
    t.integer  "working_estimate_id"
    t.integer  "project_id"
    t.string   "working_title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "active",              default: false, null: false
    t.index ["project_id", "working_estimate_id"], name: "unique_p_w_e_index", unique: true, using: :btree
    t.index ["project_id"], name: "index_project_working_estimates_on_project_id", using: :btree
    t.index ["working_estimate_id"], name: "index_project_working_estimates_on_working_estimate_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.date     "start_date"
    t.string   "doc_name"
    t.string   "project_name"
    t.date     "end_date"
    t.integer  "company_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["company_id"], name: "index_projects_on_company_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "specialists", force: :cascade do |t|
    t.string   "name"
    t.integer  "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_workings", force: :cascade do |t|
    t.string   "title"
    t.integer  "working_hour"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "default_sp_ids", default: [], null: false, array: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  create_table "working_estimates", force: :cascade do |t|
    t.string   "working_title"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "default_sw_ids", default: [],    null: false, array: true
    t.integer  "clone_id"
    t.boolean  "draft",          default: false
  end

  add_foreign_key "companies", "users"
  add_foreign_key "project_working_estimate_subworking_specialists", "project_working_estimate_subworkings"
  add_foreign_key "project_working_estimate_subworking_specialists", "specialists"
  add_foreign_key "project_working_estimate_subworkings", "project_working_estimates"
  add_foreign_key "project_working_estimate_subworkings", "sub_workings"
  add_foreign_key "project_working_estimates", "projects"
  add_foreign_key "project_working_estimates", "working_estimates"
  add_foreign_key "projects", "companies"
end
