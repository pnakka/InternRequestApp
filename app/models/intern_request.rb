class InternRequest < ActiveRecord::Base
  attr_accessible :EndDate, :EndHour, :EveningMeetingsPercent, :InternProjectDesc, :InternProvisionEmail, :InternProvisionPhone, :OfficeDutiesPercent, :OutFieldWorkPercent, :StartDate, :StartHour, :WeekendWorkPercent
  
  has_and_belongs_to_many :enrichment_acts
  has_and_belongs_to_many :intern_questions
  
  belongs_to :agency
  belongs_to :job
  belongs_to :department
  belongs_to :mentor
  belongs_to :authorized_person
  belongs_to :contact
  belongs_to :internship_location
  belongs_to :status
  belongs_to :address
  belongs_to :interviewer
  
  
end
