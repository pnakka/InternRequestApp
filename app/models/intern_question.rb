class InternQuestion < ActiveRecord::Base
  attr_accessible :name, :value
  
  has_and_belongs_to_many :intern_requests
end
