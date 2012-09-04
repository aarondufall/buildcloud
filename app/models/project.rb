class Project < ActiveRecord::Base
  attr_accessible :created_by, :job_number, :name
  belongs_to :team
  has_many :todolists, :dependent => :destroy
  has_many :todos, :through => :todolists
  has_many :issues do 
  	
  	def open
  		reject { |r| r.closed_at? }
  	end

  	def closed
  		select { |r| r.closed_at? }	
  	end
  	
  end
  
  validates :team, presence: true

end
