class FollowUp < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :comment
end
