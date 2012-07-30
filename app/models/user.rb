class User < ActiveRecord::Base
  after_create :set_user_on_team
  before_destroy { teams.clear }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  
  # attr_accessible :title, :body

  has_and_belongs_to_many :teams
  has_one :owned_team, :class_name => "Team", :foreign_key => 'user_id', :dependent => :destroy
  
  has_one :profile
  accepts_nested_attributes_for :profile
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes

  searchable do
    text :users_name do
      profile.name
    end
  end



  private
    


    def set_user_on_team
      self.create_owned_team(:name => self.profile.name ).users << self

    end
 
end
