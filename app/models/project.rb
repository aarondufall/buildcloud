class Project < ActiveRecord::Base
  attr_accessible :created_by, :job_number, :name
  belongs_to :team
  has_many :worklists, :dependent => :destroy
  has_many :todos, :through => :worklists
  has_many :issues

  validates :team, presence: true

end
