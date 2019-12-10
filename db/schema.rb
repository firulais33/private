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

ActiveRecord::Schema.define(version: 2019_12_09_033744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carros", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "body"
    t.integer "valoracion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "restaurant_id"
  end

  create_table "coments", force: :cascade do |t|
    t.text "body"
    t.integer "puntaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plato_id"
    t.integer "user_id"
    t.integer "restaurant_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "descuento", default: 0
    t.integer "precio_total"
    t.string "direccion"
    t.string "aclaraciones"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "placements", force: :cascade do |t|
    t.bigint "pedido_id"
    t.bigint "plato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cantidad", default: 1
    t.integer "carro_id"
    t.integer "restaurant_id"
    t.string "status", default: "Pendiente"
    t.string "direccion"
    t.string "aclaraciones", default: "empty"
    t.index ["pedido_id"], name: "index_placements_on_pedido_id"
    t.index ["plato_id"], name: "index_placements_on_plato_id"
  end

  create_table "platos", force: :cascade do |t|
    t.string "nombre"
    t.string "precio"
    t.text "descripcion"
    t.string "cantidad_personas"
    t.string "imagen"
    t.string "valoracion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "restaurant_id"
    t.string "plato_img_file_name"
    t.string "plato_img_content_type"
    t.integer "plato_img_file_size"
    t.datetime "plato_img_updated_at"
    t.text "fav", default: [], array: true
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "nombre"
    t.string "correo"
    t.string "direccion"
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "aceptado"
    t.string "restaurant_img_file_name"
    t.string "restaurant_img_content_type"
    t.integer "restaurant_img_file_size"
    t.datetime "restaurant_img_updated_at"
    t.text "fav", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pedidos", "users"
  add_foreign_key "placements", "pedidos"
  add_foreign_key "placements", "platos"
end
