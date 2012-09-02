class User < ActiveRecord::Base
  after_create :new_company_account_setup
  before_destroy { teams.clear }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  # attr_accessible :title, :body

  has_and_belongs_to_many :teams
  has_many :projects, :through => :teams
  has_one :account, :dependent => :destroy
 

  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :todos, :class_name => "todo", :foreign_key => 'assigned_to_id', :dependent => :destroy
  has_many :created_todos, :class_name => "todo", :foreign_key => 'created_by_id', :dependent => :destroy
  has_many :issues

  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes

  searchable do
    text :users_name do
      profile.name
    end
  end



  private
    def add_invited_user_to_team
      #join team related to token
    end

    def new_company_account_setup
      self.create_account(:name => self.profile.company ).create_team(:name => self.profile.company ).users << self

    end

end
