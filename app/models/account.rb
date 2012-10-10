class Account < ActiveRecord::Base
  attr_accessible :account_owner_id, :name, :plan
  belongs_to :owner, :class_name => "User", :foreign_key => 'user_id'
  has_one :team
  has_many :invites
end
