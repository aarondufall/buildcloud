class Project < ActiveRecord::Base
  attr_accessible :created_by, :job_number, :name
  belongs_to :team
  has_many :todolists, :dependent => :destroy
  validates :team, presence: true

end
