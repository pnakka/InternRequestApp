class Contact < ActiveRecord::Base
  attr_accessible :Email, :FirstName, :LastName, :phone
  
  belongs_to :agency
  has_one :address
  has_many :intern_requests
  
end
