class User < ActiveRecord::Base
  after_create :set_user_on_team
  before_destroy { teams.clear }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_and_belongs_to_many :teams
  has_one :owned_team, :class_name => "Team", :foreign_key => 'user_id', :dependent => :destroy

  

def self.search(search)
  	if search
    	find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
end

  private
    def set_user_on_team
      self.owned_team = self.teams.create(:name => 'username' ) 
    end
 
end
