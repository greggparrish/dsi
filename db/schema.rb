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

ActiveRecord::Schema.define(version: 20180312130417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "cache_container", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade, comment: "Storage for the cache API." do |t|
    t.binary  "data",                                                                         comment: "A collection of data to cache."
    t.integer "expire",                                          default: 0,     null: false, comment: "A Unix timestamp indicating when the cache entry should expire, or -1 for never."
    t.decimal "created",                precision: 14, scale: 3, default: "0.0", null: false, comment: "A timestamp with millisecond precision indicating when the cache entry was created."
    t.integer "serialized", limit: 2,                            default: 0,     null: false, comment: "A flag to indicate whether content is serialized (1) or not (0)."
    t.text    "tags",                                                                         comment: "Space-separated list of cache tags for this entry."
    t.string  "checksum",   limit: 255,                                          null: false, comment: "The tag invalidation checksum when this entry was saved."
    t.index ["expire"], name: "cache_container__expire__idx", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.string   "playlist_id"
    t.integer  "image_id"
    t.index ["image_id"], name: "index_genres_on_image_id", using: :btree
    t.index ["slug"], name: "index_genres_on_slug", unique: true, using: :btree
  end

  create_table "headers", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.string   "guide"
    t.string   "guide_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "modelname"
    t.integer  "image_id"
    t.index ["image_id"], name: "index_headers_on_image_id", using: :btree
  end

  create_table "histories", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "description"
    t.string   "media"
    t.string   "slug"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "exclude_from_map",      default: false
    t.boolean  "exclude_from_timeline", default: false
    t.integer  "image_id"
    t.string   "address"
    t.index ["date"], name: "index_histories_on_date", using: :btree
    t.index ["image_id"], name: "index_histories_on_image_id", using: :btree
    t.index ["slug"], name: "index_histories_on_slug", unique: true, using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "file"
    t.string   "credit"
    t.text     "description"
    t.string   "slug"
    t.index ["title"], name: "index_images_on_title", unique: true, using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.string   "question"
    t.text     "introduction"
    t.text     "objectives"
    t.text     "activities"
    t.text     "assessment"
    t.text     "standards"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.integer  "image_id"
    t.index ["created_at"], name: "index_lessons_on_created_at", using: :btree
    t.index ["image_id"], name: "index_lessons_on_image_id", using: :btree
    t.index ["title"], name: "index_lessons_on_title", using: :btree
  end

  create_table "news_items", force: :cascade do |t|
    t.string   "title"
    t.string   "place"
    t.date     "date"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.index ["slug"], name: "index_news_items_on_slug", unique: true, using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.string   "name"
    t.string   "place"
    t.string   "email"
    t.string   "image"
    t.text     "story_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "published"
    t.index ["published"], name: "index_stories_on_published", using: :btree
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
    t.integer  "role"
    t.string   "username"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "genres", "images"
  add_foreign_key "headers", "images"
  add_foreign_key "histories", "images"
  add_foreign_key "lessons", "images"
end
