class FollowUp < ActiveRecord::Base
  belongs_to :issue
  belongs_to :followed_up_by, :class_name => "User", :foreign_key => 'followed_up_by_id'
  # attr_accessible :title, :body
end
