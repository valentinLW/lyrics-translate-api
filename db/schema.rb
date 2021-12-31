# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_31_183348) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lyrics", force: :cascade do |t|
    t.integer "translation_id", null: false
    t.string "content"
    t.integer "line"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["translation_id"], name: "index_lyrics_on_translation_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "artist_id", null: false
    t.integer "language_id", null: false
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["language_id"], name: "index_songs_on_language_id"
  end

  create_table "translations", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "language_id", null: false
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_translations_on_language_id"
    t.index ["song_id"], name: "index_translations_on_song_id"
  end

  add_foreign_key "lyrics", "translations"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "languages"
  add_foreign_key "translations", "languages"
  add_foreign_key "translations", "songs"
end
