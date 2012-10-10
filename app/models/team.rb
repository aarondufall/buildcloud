class Team < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name
  has_and_belongs_to_many :users, :before_add => :validates_user
  belongs_to :owner, :class_name => "Account", :foreign_key => 'account_id'
  has_many :projects
  has_many :contacts

  def validates_user(user)
  	raise ActiveRecord::Rollback if self.users.include? user
  end

  def give_user_access(user)
    users << user
  end

end