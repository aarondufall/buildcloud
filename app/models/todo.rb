class Todo < ActiveRecord::Base
  attr_accessible :assigned_to_id, :completed_at, :created_by_id, :focused, :name, :scheduled
  belongs_to :worklist
  belongs_to :assigned_to, :class_name => "User", :foreign_key => 'assigned_to_id'
  belongs_to :created_by, :class_name => "User", :foreign_key => 'created_by_id'
  has_many :issues

  validates :name, :presence => true

  def self.incomplete
    where completed_at: nil
  end

  def self.completed
    where "completed_at IS NOT NULL"
  end

  def complete!
    update_attributes completed_at: Time.now
  end

  def incomplete!
    update_attributes completed_at: nil
  end

end
