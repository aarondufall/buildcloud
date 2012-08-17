class Todo < ActiveRecord::Base
  attr_accessible :assigned_to, :completed_at, :created_by, :focused, :name, :scheduled
  belongs_to :todolist
  belongs_to :assigned_to, :class_name => "User", :foreign_key => 'user_id'
  belongs_to :created_by, :class_name => "User", :foreign_key => 'user_id'

  validates :name, :presence => true
end
