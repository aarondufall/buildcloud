class Project < ActiveRecord::Base

  attr_accessible :created_by, :job_number, :name

  belongs_to :account

  has_many :worklists, :dependent => :destroy
  has_many :items,     :through => :worklists
  has_many :issues
   

  include Membership::HasMembersMixin

  def self.directly_accessible_by(user)
    # arel_table[:owner_id].eq(user.id)
    user.team_ids.presence && arel_table[:team_id].in(user.team_ids)
  end

  

end
