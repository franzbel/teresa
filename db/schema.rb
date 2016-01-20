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

ActiveRecord::Schema.define(version: 20160118182629) do

  create_table "applicants", force: :cascade do |t|
    t.integer  "job_vacancy_id"
    t.integer  "applicant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "applicants", ["job_vacancy_id"], name: "index_applicants_on_job_vacancy_id"

  create_table "educations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "degree_name"
    t.string   "school_name"
    t.text     "education_description"
    t.integer  "resume_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "educations", ["resume_id"], name: "index_educations_on_resume_id"

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "emails", ["resume_id"], name: "index_emails_on_resume_id"

  create_table "experiences", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "job_title"
    t.string   "company_name"
    t.text     "job_description"
    t.integer  "resume_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "experiences", ["resume_id"], name: "index_experiences_on_resume_id"

  create_table "job_vacancies", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "state"
    t.string   "education"
    t.integer  "years_of_experience"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "job_vacancies", ["user_id"], name: "index_job_vacancies_on_user_id"

  create_table "phones", force: :cascade do |t|
    t.integer  "number"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phones", ["resume_id"], name: "index_phones_on_resume_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "resume_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "photos", ["resume_id"], name: "index_photos_on_resume_id"

  create_table "pictures", force: :cascade do |t|
    t.integer  "post_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "idol_id"
    t.integer  "fan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "relationships", ["fan_id"], name: "index_relationships_on_fan_id"
  add_index "relationships", ["idol_id", "fan_id"], name: "index_relationships_on_idol_id_and_fan_id", unique: true
  add_index "relationships", ["idol_id"], name: "index_relationships_on_idol_id"

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id"

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sites", ["resume_id"], name: "index_sites_on_resume_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

end
