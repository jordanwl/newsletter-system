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

ActiveRecord::Schema.define(version: 2020_02_03_081447) do

  create_table "email_sents", force: :cascade do |t|
    t.boolean "custom_email"
    t.integer "user_id"
    t.integer "email_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_id"], name: "index_email_sents_on_email_id"
    t.index ["user_id"], name: "index_email_sents_on_user_id"
  end

  create_table "emails", force: :cascade do |t|
    t.integer "newsletter_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["newsletter_id"], name: "index_emails_on_newsletter_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["user_id"], name: "index_newsletters_on_user_id"
  end

  create_table "sub_trackers", force: :cascade do |t|
    t.integer "newsletter_id"
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unique_url"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "newsletter_id"
    t.integer "subscriber_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["newsletter_id"], name: "index_subscriptions_on_newsletter_id"
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
  end

  add_foreign_key "email_sents", "emails"
  add_foreign_key "email_sents", "users"
  add_foreign_key "emails", "newsletters"
  add_foreign_key "newsletters", "users"
  add_foreign_key "subscriptions", "newsletters"
  add_foreign_key "subscriptions", "subscribers"
end
