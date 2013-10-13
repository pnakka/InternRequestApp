class AuthorizedPerson < ActiveRecord::Base
  attr_accessible :FirstName, :LastName, :department, :email, :phone, :title
  
  belongs_to :agency
  has_many :intern_requests
end
