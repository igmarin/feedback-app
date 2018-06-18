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

ActiveRecord::Schema.define(version: 2018_06_18_061350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "performance_answers", force: :cascade do |t|
    t.bigint "performance_question_id"
    t.string "question"
    t.bigint "performance_review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_question_id"], name: "index_performance_answers_on_performance_question_id"
    t.index ["performance_review_id"], name: "index_performance_answers_on_performance_review_id"
  end

  create_table "performance_questions", force: :cascade do |t|
    t.string "question"
    t.bigint "performance_review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_review_id"], name: "index_performance_questions_on_performance_review_id"
  end

  create_table "performance_reviews", force: :cascade do |t|
    t.string "title"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_performance_reviews_on_user_id"
  end

  create_table "reviewers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "performance_review_id"
    t.datetime "due_date"
    t.boolean "done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_review_id"], name: "index_reviewers_on_performance_review_id"
    t.index ["user_id"], name: "index_reviewers_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "performance_answers", "performance_questions"
  add_foreign_key "performance_answers", "performance_reviews"
  add_foreign_key "performance_questions", "performance_reviews"
  add_foreign_key "performance_reviews", "users"
  add_foreign_key "reviewers", "performance_reviews"
  add_foreign_key "reviewers", "users"
  add_foreign_key "users", "roles"
end
