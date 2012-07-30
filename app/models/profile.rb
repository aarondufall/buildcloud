class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :company, :location, :professional_bio
  
end
