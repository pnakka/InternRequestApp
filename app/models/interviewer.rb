class Interviewer < ActiveRecord::Base
  attr_accessible :email, :FirstName, :LastName, :phone, :title
  
  has_many :intern_requests
  
end
