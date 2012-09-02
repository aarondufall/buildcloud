class Issue < ActiveRecord::Base
  attr_accessible :assigned_to_id, :closed_at, :description, :title, :todo_id, :type
  belongs_to :todo
  belongs_to :user, :class_name => "User", :foreign_key => 'assigned_to_id'
  belongs_to :project
  validates :title, :presence => true
end
