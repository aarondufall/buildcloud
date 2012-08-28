class Issue < ActiveRecord::Base
  attr_accessible :assigned_to_id, :closed_at, :description, :title, :todo_id, :type
  belongs_to :todo
end
