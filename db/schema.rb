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

ActiveRecord::Schema.define(version: 20160325204558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "post_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["author_type", "author_id"], name: "index_comments_on_author_type_and_author_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "exercise_sessions", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "workout_session_id"
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "weight"
    t.integer  "distance"
    t.boolean  "completed",          default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "exercise_sessions", ["exercise_id"], name: "index_exercise_sessions_on_exercise_id", using: :btree
  add_index "exercise_sessions", ["workout_session_id"], name: "index_exercise_sessions_on_workout_session_id", using: :btree

  create_table "exercise_types", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "video_url"
    t.text     "description", null: false
    t.integer  "trainer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "exercise_types", ["trainer_id"], name: "index_exercise_types_on_trainer_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.integer  "exercise_type_id"
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "weight"
    t.integer  "distance"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "workout_id"
  end

  add_index "exercises", ["exercise_type_id"], name: "index_exercises_on_exercise_type_id", using: :btree
  add_index "exercises", ["workout_id"], name: "index_exercises_on_workout_id", using: :btree

  create_table "followings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "followings", ["trainer_id"], name: "index_followings_on_trainer_id", using: :btree
  add_index "followings", ["user_id"], name: "index_followings_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "image",      null: false
    t.integer  "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["trainer_id"], name: "index_photos_on_trainer_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "content",    null: false
    t.string   "image"
    t.integer  "trainer_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["program_id"], name: "index_posts_on_program_id", using: :btree
  add_index "posts", ["trainer_id"], name: "index_posts_on_trainer_id", using: :btree

  create_table "program_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "preview",         null: false
    t.text     "description",     null: false
    t.string   "banner",          null: false
    t.integer  "duration",        null: false
    t.integer  "price",           null: false
    t.integer  "trainer_id"
    t.integer  "program_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "programs", ["program_type_id"], name: "index_programs_on_program_type_id", using: :btree
  add_index "programs", ["trainer_id"], name: "index_programs_on_trainer_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchases", ["program_id"], name: "index_purchases_on_program_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "value",      null: false
    t.integer  "program_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["program_id"], name: "index_ratings_on_program_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "rpush_apps", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "environment"
    t.text     "certificate"
    t.string   "password"
    t.integer  "connections",             default: 1, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type",                                null: false
    t.string   "auth_key"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string   "device_token", limit: 64, null: false
    t.datetime "failed_at",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "app_id"
  end

  add_index "rpush_feedback", ["device_token"], name: "index_rpush_feedback_on_device_token", using: :btree

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer  "badge"
    t.string   "device_token",      limit: 64
    t.string   "sound",                        default: "default"
    t.text     "alert"
    t.text     "data"
    t.integer  "expiry",                       default: 86400
    t.boolean  "delivered",                    default: false,     null: false
    t.datetime "delivered_at"
    t.boolean  "failed",                       default: false,     null: false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.text     "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "alert_is_json",                default: false
    t.string   "type",                                             null: false
    t.string   "collapse_key"
    t.boolean  "delay_while_idle",             default: false,     null: false
    t.text     "registration_ids"
    t.integer  "app_id",                                           null: false
    t.integer  "retries",                      default: 0
    t.string   "uri"
    t.datetime "fail_after"
    t.boolean  "processing",                   default: false,     null: false
    t.integer  "priority"
    t.text     "url_args"
    t.string   "category"
    t.boolean  "content_available",            default: false
    t.text     "notification"
  end

  add_index "rpush_notifications", ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))", using: :btree

  create_table "specializations", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["trainer_id"], name: "index_subscriptions_on_trainer_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "trainers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "phone_number",                        null: false
    t.text     "description",                         null: false
    t.string   "place_of_work",                       null: false
    t.integer  "specialization_id"
    t.string   "avatar",                              null: false
    t.string   "banner",                              null: false
    t.string   "category",                            null: false
    t.integer  "experience",                          null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "trainers", ["email"], name: "index_trainers_on_email", unique: true, using: :btree
  add_index "trainers", ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "phone_number"
    t.text     "description"
    t.string   "avatar"
    t.string   "banner"
    t.integer  "height"
    t.integer  "weight"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "api_token",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "vk_id"
    t.integer  "fb_id"
    t.string   "device_token"
    t.string   "platform"
  end

  create_table "verification_tokens", force: :cascade do |t|
    t.string   "token",                        null: false
    t.string   "phone_number",                 null: false
    t.integer  "code",                         null: false
    t.boolean  "verified",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "workout_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.date     "scheduled_for"
    t.boolean  "completed",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "workout_sessions", ["user_id"], name: "index_workout_sessions_on_user_id", using: :btree
  add_index "workout_sessions", ["workout_id"], name: "index_workout_sessions_on_workout_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "program_id"
  end

  add_index "workouts", ["program_id"], name: "index_workouts_on_program_id", using: :btree

  add_foreign_key "exercise_sessions", "exercises"
  add_foreign_key "exercise_sessions", "workout_sessions"
  add_foreign_key "exercise_types", "trainers"
  add_foreign_key "exercises", "exercise_types"
  add_foreign_key "exercises", "workouts"
  add_foreign_key "followings", "trainers"
  add_foreign_key "followings", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "photos", "trainers"
  add_foreign_key "posts", "programs"
  add_foreign_key "posts", "trainers"
  add_foreign_key "programs", "program_types"
  add_foreign_key "programs", "trainers"
  add_foreign_key "purchases", "programs"
  add_foreign_key "purchases", "users"
  add_foreign_key "ratings", "programs"
  add_foreign_key "ratings", "users"
  add_foreign_key "subscriptions", "trainers"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "workout_sessions", "users"
  add_foreign_key "workout_sessions", "workouts"
end
