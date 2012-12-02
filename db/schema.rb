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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121202112542) do

  create_table "attempts", :force => true do |t|
    t.text     "answer"
    t.boolean  "is_correct"
    t.datetime "created_at",  :null => false
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "updated_at",  :null => false
  end

  add_index "attempts", ["question_id"], :name => "index_attempts_on_question_id"
  add_index "attempts", ["user_id"], :name => "index_attempts_on_user_id"

  create_table "hydra_attribute_sets", :id => false, :force => true do |t|
    t.integer "hydra_attribute_id", :null => false
    t.integer "hydra_set_id",       :null => false
  end

  add_index "hydra_attribute_sets", ["hydra_attribute_id", "hydra_set_id"], :name => "hydra_attribute_sets_index", :unique => true

  create_table "hydra_attributes", :force => true do |t|
    t.string   "entity_type",   :limit => 32,                    :null => false
    t.string   "name",          :limit => 32,                    :null => false
    t.string   "backend_type",  :limit => 16,                    :null => false
    t.string   "default_value"
    t.boolean  "white_list",                  :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_attributes", ["entity_type", "name"], :name => "hydra_attributes_index", :unique => true

  create_table "hydra_boolean_questions", :force => true do |t|
    t.integer  "entity_id",          :null => false
    t.integer  "hydra_attribute_id", :null => false
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_boolean_questions", ["entity_id", "hydra_attribute_id"], :name => "hydra_boolean_questions_index", :unique => true

  create_table "hydra_datetime_questions", :force => true do |t|
    t.integer  "entity_id",          :null => false
    t.integer  "hydra_attribute_id", :null => false
    t.datetime "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_datetime_questions", ["entity_id", "hydra_attribute_id"], :name => "hydra_datetime_questions_index", :unique => true

  create_table "hydra_float_questions", :force => true do |t|
    t.integer  "entity_id",          :null => false
    t.integer  "hydra_attribute_id", :null => false
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_float_questions", ["entity_id", "hydra_attribute_id"], :name => "hydra_float_questions_index", :unique => true

  create_table "hydra_integer_questions", :force => true do |t|
    t.integer  "entity_id",          :null => false
    t.integer  "hydra_attribute_id", :null => false
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_integer_questions", ["entity_id", "hydra_attribute_id"], :name => "hydra_integer_questions_index", :unique => true

  create_table "hydra_sets", :force => true do |t|
    t.string   "entity_type", :limit => 32, :null => false
    t.string   "name",        :limit => 32, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_sets", ["entity_type", "name"], :name => "hydra_sets_index", :unique => true

  create_table "hydra_string_questions", :force => true do |t|
    t.integer  "entity_id",          :null => false
    t.integer  "hydra_attribute_id", :null => false
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_string_questions", ["entity_id", "hydra_attribute_id"], :name => "hydra_string_questions_index", :unique => true

  create_table "hydra_text_questions", :force => true do |t|
    t.integer  "entity_id",          :null => false
    t.integer  "hydra_attribute_id", :null => false
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydra_text_questions", ["entity_id", "hydra_attribute_id"], :name => "hydra_text_questions_index", :unique => true

  create_table "question_groups", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "question_groups_questions", :id => false, :force => true do |t|
    t.integer "question_group_id", :null => false
    t.integer "question_id",       :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "xml"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "hydra_set_id"
  end

  add_index "questions", ["hydra_set_id"], :name => "questions_hydra_set_id_index"

  create_table "questions_tags", :id => false, :force => true do |t|
    t.integer "question_id", :null => false
    t.integer "tag_id",      :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_groups_users", :id => false, :force => true do |t|
    t.integer "user_group_id", :null => false
    t.integer "user_id",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
