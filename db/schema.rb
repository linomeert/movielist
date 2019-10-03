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

ActiveRecord::Schema.define(version: 2019_09_25_112214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_movie_lists_on_admin_id"
  end

  create_table "movie_lists_movies", id: false, force: :cascade do |t|
    t.bigint "movie_list_id", null: false
    t.bigint "movie_id", null: false
    t.index ["movie_id", "movie_list_id"], name: "index_movie_lists_movies_on_movie_id_and_movie_list_id"
    t.index ["movie_list_id", "movie_id"], name: "index_movie_lists_movies_on_movie_list_id_and_movie_id"
  end

  create_table "movie_lists_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_list_id", null: false
    t.index ["movie_list_id", "user_id"], name: "index_movie_lists_users_on_movie_list_id_and_user_id"
    t.index ["user_id", "movie_list_id"], name: "index_movie_lists_users_on_user_id_and_movie_list_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "director"
    t.text "cast"
    t.integer "imdb_rating"
    t.string "genre"
    t.string "image"
    t.boolean "watched", default: false
    t.string "imdb_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
    t.text "review"
    t.index ["movie_id"], name: "index_user_ratings_on_movie_id"
    t.index ["user_id"], name: "index_user_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "movie_lists", "users", column: "admin_id"
  add_foreign_key "user_ratings", "movies"
  add_foreign_key "user_ratings", "users"
end
