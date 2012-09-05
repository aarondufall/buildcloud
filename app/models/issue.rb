class Issue < ActiveRecord::Base
  attr_accessible :assigned_to_id, :closed_at, :description, :title, :todo_id, :issue_type, :created_by_id
  belongs_to :todo
  belongs_to :user, :class_name => "User", :foreign_key => 'assigned_to_id'
  belongs_to :project
  belongs_to :created_by, :class_name => "User", :foreign_key => 'created_by_id'
  validates :title, :presence => true
  validates :issue_type, :presence => true
  validates :created_by, :presence => true

  def self.opened
    where closed_at: nil
  end

  def self.closed
    where "closed_at IS NOT NULL"
  end


  def close!
    update_attributes closed_at: Time.now
  end

  def reopen!
    update_attributes closed_at: nil
  end
end
