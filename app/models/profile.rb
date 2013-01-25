class Profile < ActiveRecord::Base
  has_one :User
  attr_accessible :comment, :email, :end_date, :start_date, :leave_type, :hour, :minute	,:approved

 
  
end
