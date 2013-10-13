class InternshipLocation < ActiveRecord::Base
  attr_accessible :phone
  
  has_many :intern_requests
  belongs_to :agency
  belongs_to :county
  
end
