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

ActiveRecord::Schema.define(:version => 20120822050832) do

  create_table "addresses", :force => true do |t|
    t.string   "StreetNumber"
    t.string   "StreetName"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "agency_id"
    t.integer  "contact_id"
  end

  create_table "agencies", :force => true do |t|
    t.string   "AgencyName"
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "fax"
    t.integer  "county_id"
  end

  create_table "authorized_people", :force => true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "title"
    t.string   "department"
    t.integer  "phone"
    t.string   "email"
    t.integer  "agency_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "Email"
    t.integer  "phone"
    t.integer  "agency_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counties", :force => true do |t|
    t.string   "CountyName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "Name"
    t.integer  "agency_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enrichment_acts", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enrichment_acts_intern_requests", :id => false, :force => true do |t|
    t.integer "intern_request_id"
    t.integer "enrichment_act_id"
  end

  create_table "intern_questions", :force => true do |t|
    t.string   "name"
    t.boolean  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "intern_requests", :force => true do |t|
    t.text     "InternProjectDesc"
    t.time     "StartHour"
    t.time     "EndHour"
    t.date     "StartDate"
    t.date     "EndDate"
    t.integer  "OfficeDutiesPercent"
    t.integer  "OutFieldWorkPercent"
    t.integer  "EveningMeetingsPercent"
    t.integer  "WeekendWorkPercent"
    t.boolean  "InternProvisionPhone"
    t.boolean  "InternProvisionEmail"
    t.integer  "agency_id"
    t.integer  "job_id"
    t.integer  "department_id"
    t.integer  "mentor_id"
    t.integer  "authorized_person_id"
    t.integer  "contact_id"
    t.integer  "internship_location_id"
    t.integer  "status_id"
    t.integer  "address_id"
    t.integer  "interviewer_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "internship_locations", :force => true do |t|
    t.integer  "phone"
    t.integer  "agency_id"
    t.integer  "county_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interviewers", :force => true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "email"
    t.string   "title"
    t.integer  "phone"
    t.integer  "agency_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "Job_title"
    t.text     "JobDesc"
    t.text     "RequiredSkills_1"
    t.text     "RequiredSkills_2"
    t.text     "RequiredSkills_3"
    t.datetime "Startdate"
    t.datetime "Enddate"
    t.decimal  "MinHourlyRate",    :precision => 10, :scale => 0
    t.decimal  "MaxHourlyRate",    :precision => 10, :scale => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "login_users", :force => true do |t|
    t.string   "Login"
    t.string   "Password"
    t.string   "Email"
    t.string   "FirstName"
    t.string   "LastName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mentors", :force => true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "title"
    t.string   "department"
    t.integer  "phone"
    t.string   "email"
    t.integer  "agency_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "StatusDescription"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
