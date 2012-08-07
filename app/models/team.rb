class Team < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name
  has_and_belongs_to_many :users, :before_add => :validates_user
  belongs_to :owner, :class_name => "User", :foreign_key => 'user_id'
  has_many :projects

  def validates_user(user)
  	raise ActiveRecord::Rollback if self.users.include? user
  end

  
end
