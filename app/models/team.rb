class Team < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name
  has_and_belongs_to_many :users
  belongs_to :owner, :class_name => "User", :foreign_key => 'user_id'

  
end
