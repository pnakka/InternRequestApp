class EnrichmentAct < ActiveRecord::Base
  attr_accessible :desc, :name
  
  has_and_belongs_to_many :intern_requests
end
