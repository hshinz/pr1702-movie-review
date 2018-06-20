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

ActiveRecord::Schema.define(version: 20180622111316) do

  create_table "comments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descriptions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "director_name"
    t.string "cast_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interactives", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.integer "interactable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id", "user_id"], name: "index_like_reviews_on_review_id_and_user_id", unique: true
  end

  create_table "movies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "image"
    t.string "trailer"
    t.text "synopsis"
    t.date "release_date"
    t.integer "genre_id"
    t.integer "description_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "length"
  end

  create_table "notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "notifiable_type", null: false
    t.integer "notifiable_id", null: false
    t.string "key", null: false
    t.string "group_type"
    t.integer "group_id"
    t.integer "group_owner_id"
    t.string "notifier_type"
    t.integer "notifier_id"
    t.text "parameters"
    t.datetime "opened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id"
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id"
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id"
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "reviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
  end

  create_table "subscriptions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "key", null: false
    t.boolean "subscribing", default: true, null: false
    t.boolean "subscribing_to_email", default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text "optional_targets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_subscriptions_on_key"
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
