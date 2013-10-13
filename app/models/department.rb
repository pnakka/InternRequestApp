class Department < ActiveRecord::Base
  attr_accessible :Name
  
  belongs_to :agency
  has_many :intern_requests
end
