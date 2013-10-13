class County < ActiveRecord::Base
  attr_accessible :CountyName
  
  has_many :agencies
  has_many :internship_locations
end
