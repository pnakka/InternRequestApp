class Status < ActiveRecord::Base
  attr_accessible :StatusDescription
  
  has_many :intern_requests
end
