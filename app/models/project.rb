class Project < ActiveRecord::Base
  attr_accessible :created_by, :job_number, :name
  belongs_to :team

  

  
end