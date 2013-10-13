class LoginUser < ActiveRecord::Base
  attr_accessible :Login, :Password, :Email
end
