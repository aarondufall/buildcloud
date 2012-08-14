class Tasklist < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date
  belongs_to :project
end
