class Address < ActiveRecord::Base
  attr_accessible :city, :state, :StreetName, :StreetNumber, :zip
  
  belongs_to :agency
  belongs_to :contact
  has_many :intern_requests
end
