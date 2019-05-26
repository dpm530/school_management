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

ActiveRecord::Schema.define(version: 2019_05_26_200521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "due_date"
    t.date "date_assigned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_assignments_on_course_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.boolean "present", default: true
    t.bigint "course_id"
    t.bigint "student_id"
    t.index ["course_id"], name: "index_attendances_on_course_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gradebooks", force: :cascade do |t|
    t.string "letter_score"
    t.integer "number_score"
    t.text "comment"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.string "session"
    t.string "year"
    t.date "start_date"
    t.date "end_date"
    t.index ["course_id"], name: "index_gradebooks_on_course_id"
    t.index ["student_id"], name: "index_gradebooks_on_student_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "student_contact_infos", force: :cascade do |t|
    t.string "line_1_address"
    t.string "line_2_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "mobile_number"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_contact_infos_on_student_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "grade_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.string "image"
    t.index ["parent_id"], name: "index_students_on_parent_id"
  end

  create_table "teacher_contact_infos", force: :cascade do |t|
    t.string "line_1_address"
    t.string "line_2_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "mobile_number"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teacher_contact_infos_on_teacher_id"
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_teacher_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teacher_courses_on_teacher_id"
  end

  create_table "teacher_parent_conversations", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_teacher_parent_conversations_on_parent_id"
    t.index ["teacher_id"], name: "index_teacher_parent_conversations_on_teacher_id"
  end

  create_table "teacher_parent_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "teacher_parent_conversation_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sender"
    t.bigint "teacher_id"
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_teacher_parent_messages_on_parent_id"
    t.index ["teacher_id"], name: "index_teacher_parent_messages_on_teacher_id"
    t.index ["teacher_parent_conversation_id"], name: "index_teacher_parent_messages_on_teacher_parent_conversation_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "assignments", "courses"
  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "students"
  add_foreign_key "gradebooks", "courses"
  add_foreign_key "gradebooks", "students"
  add_foreign_key "student_contact_infos", "students"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
  add_foreign_key "students", "parents"
  add_foreign_key "teacher_contact_infos", "teachers"
  add_foreign_key "teacher_courses", "courses"
  add_foreign_key "teacher_courses", "teachers"
  add_foreign_key "teacher_parent_conversations", "parents"
  add_foreign_key "teacher_parent_conversations", "teachers"
  add_foreign_key "teacher_parent_messages", "parents"
  add_foreign_key "teacher_parent_messages", "teacher_parent_conversations"
  add_foreign_key "teacher_parent_messages", "teachers"
end
