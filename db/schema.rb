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

ActiveRecord::Schema.define(version: 20170308230258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "post_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["author_type", "author_id"], name: "index_comments_on_author_type_and_author_id", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
  end

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
    t.integer  "duration"
    t.index ["exercise_id"], name: "index_exercise_sessions_on_exercise_id", using: :btree
    t.index ["workout_session_id"], name: "index_exercise_sessions_on_workout_session_id", using: :btree
  end

  create_table "exercise_types", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "video_url"
    t.text     "description", null: false
    t.integer  "trainer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "tips"
    t.index ["trainer_id"], name: "index_exercise_types_on_trainer_id", using: :btree
  end

  create_table "exercises", force: :cascade do |t|
    t.integer  "exercise_type_id"
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "weight"
    t.integer  "distance"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "workout_id"
    t.integer  "duration"
    t.index ["exercise_type_id"], name: "index_exercises_on_exercise_type_id", using: :btree
    t.index ["workout_id"], name: "index_exercises_on_workout_id", using: :btree
  end

  create_table "followings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_followings_on_trainer_id", using: :btree
    t.index ["user_id"], name: "index_followings_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content",         null: false
    t.string   "category",        null: false
    t.integer  "subscription_id"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["subscription_id"], name: "index_messages_on_subscription_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image",      null: false
    t.integer  "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_photos_on_trainer_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content",                    null: false
    t.string   "image"
    t.integer  "trainer_id"
    t.integer  "program_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "comments_count", default: 0
    t.index ["program_id"], name: "index_posts_on_program_id", using: :btree
    t.index ["trainer_id"], name: "index_posts_on_trainer_id", using: :btree
  end

  create_table "program_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "preview"
    t.text     "description"
    t.string   "banner"
    t.integer  "price",           default: 0
    t.integer  "trainer_id"
    t.integer  "program_type_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "approved"
    t.integer  "subscription_id"
    t.float    "rating",          default: 0.0
    t.integer  "workouts_count",  default: 0
    t.integer  "users_count",     default: 0
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_programs_on_deleted_at", using: :btree
    t.index ["program_type_id"], name: "index_programs_on_program_type_id", using: :btree
    t.index ["subscription_id"], name: "index_programs_on_subscription_id", using: :btree
    t.index ["trainer_id"], name: "index_programs_on_trainer_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_purchases_on_program_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "value",        null: false
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "content"
    t.string   "ratable_type"
    t.integer  "ratable_id"
    t.index ["ratable_type", "ratable_id"], name: "index_ratings_on_ratable_type_and_ratable_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trainer_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "condition"
    t.integer  "weekly_load"
    t.string   "goal"
    t.string   "location"
    t.string   "home_equipment"
    t.date     "expires_on",              null: false
    t.datetime "last_message_created_at"
    t.datetime "viewed_by_trainer_at"
    t.index ["trainer_id"], name: "index_subscriptions_on_trainer_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name",                           null: false
    t.string   "last_name",                            null: false
    t.string   "phone_number",                         null: false
    t.text     "description",                          null: false
    t.string   "place_of_work",                        null: false
    t.integer  "specialization_id"
    t.string   "avatar",                               null: false
    t.string   "banner",                               null: false
    t.string   "category",                             null: false
    t.integer  "experience",                           null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "programs_count",         default: 0
    t.integer  "followers_count",        default: 0
    t.float    "rating",                 default: 0.0
    t.boolean  "approved"
    t.index ["email"], name: "index_trainers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer  "subscription_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["subscription_id"], name: "index_user_notifications_on_subscription_id", using: :btree
  end

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
    t.bigint   "vk_id"
    t.bigint   "fb_id"
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
    t.index ["user_id"], name: "index_workout_sessions_on_user_id", using: :btree
    t.index ["workout_id"], name: "index_workout_sessions_on_workout_id", using: :btree
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "position"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "program_id"
    t.integer  "duration"
    t.integer  "exercises_count", default: 0
    t.string   "name",                        null: false
    t.text     "tips"
    t.index ["program_id"], name: "index_workouts_on_program_id", using: :btree
  end

  add_foreign_key "exercise_sessions", "exercises"
  add_foreign_key "exercise_sessions", "workout_sessions"
  add_foreign_key "exercise_types", "trainers"
  add_foreign_key "exercises", "exercise_types"
  add_foreign_key "exercises", "workouts"
  add_foreign_key "followings", "trainers"
  add_foreign_key "followings", "users"
  add_foreign_key "messages", "subscriptions"
  add_foreign_key "photos", "trainers"
  add_foreign_key "posts", "programs"
  add_foreign_key "posts", "trainers"
  add_foreign_key "programs", "program_types"
  add_foreign_key "programs", "trainers"
  add_foreign_key "purchases", "programs"
  add_foreign_key "purchases", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "subscriptions", "trainers"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_notifications", "subscriptions"
  add_foreign_key "workout_sessions", "users"
  add_foreign_key "workout_sessions", "workouts"
end
