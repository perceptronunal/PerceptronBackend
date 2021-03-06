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

ActiveRecord::Schema.define(version: 2019_06_30_191330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "Comment_Comment"
    t.string "commenteable_type"
    t.bigint "commenteable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["commenteable_type", "commenteable_id"], name: "index_comments_on_commenteable_type_and_commenteable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.string "Connection_Type"
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "connectable_type"
    t.bigint "connectable_id"
    t.index ["connectable_type", "connectable_id"], name: "index_connections_on_connectable_type_and_connectable_id"
    t.index ["pet_id"], name: "index_connections_on_pet_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "Organization_Name"
    t.string "Organization_Address"
    t.string "Organization_Phone"
    t.string "Organization_Email"
    t.string "Organization_Website"
    t.string "Organization_Description"
    t.boolean "Organization_Validation"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "Pet_Type"
    t.string "Pet_Name"
    t.string "Pet_Gender"
    t.integer "Pet_Age"
    t.string "Pet_Size"
    t.string "Pet_Color"
    t.boolean "Pet_Sterilized"
    t.boolean "Pet_Vaccinated"
    t.text "Pet_Description"
    t.boolean "Pet_Visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "Post_Title"
    t.text "Post_Content"
    t.string "Post_Tag"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_posts_on_organization_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "Resource_Type"
    t.string "Resource_Link"
    t.string "resourceable_type"
    t.bigint "resourceable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "filename"
    t.integer "bytesize"
    t.index ["resourceable_type", "resourceable_id"], name: "index_resources_on_resourceable_type_and_resourceable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "User_Name"
    t.string "User_Email"
    t.string "User_Phone"
    t.string "User_City"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "users"
end
