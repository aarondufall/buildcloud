class Account < ActiveRecord::Base
  attr_accessible :account_owner_id, :name, :plan
  belongs_to :owner, :class_name => "User", :foreign_key => 'user_id'
  has_many :teams
  has_many :invites
  has_many :projects
  has_many :contacts
  has_many :users, through: :memberships


  include Membership::HasMembersMixin
end
