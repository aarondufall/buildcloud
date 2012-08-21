class Todo < ActiveRecord::Base
  attr_accessible :assigned_to_id, :completed_at, :created_by_id, :focused, :name, :scheduled
  belongs_to :todolist
  belongs_to :assigned_to, :class_name => "User", :foreign_key => 'assigned_to_id'
  belongs_to :created_by, :class_name => "User", :foreign_key => 'created_by_id'

  validates :name, :presence => true

  
end
