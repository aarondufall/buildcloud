class User < ActiveRecord::Base
  # after_create :add_invited_user_to_team, unless: :created_by_token
  after_create :new_company_account_setup, unless: :created_by_token
  before_destroy { teams.clear }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  # attr_accessible :title, :body

  attr_accessor :created_by_token

  has_and_belongs_to_many :teams
  has_many :projects, :through => :teams
  has_many :follow_ups
  has_one :account, :dependent => :destroy


  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :items, :class_name => "item", :foreign_key => 'assigned_to_id', :dependent => :destroy
  has_many :created_items, :class_name => "item", :foreign_key => 'created_by_id', :dependent => :destroy
  has_many :issues
  has_many :created_issues, :class_name => "User", :foreign_key => 'created_by_id'

  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes


  def self.search_for_autocomplete(text)
    includes(:profile).where("email LIKE ? OR profiles.name LIKE ?", "#{text}%", "#{text}%").limit(10)
  end

  def to_autocomplete_hash
    {
      id:   email,
      name: profile.name,
      type: "User"
    }
  end

  private
    def add_invited_user_to_team
      #join team related to token

      token = self.created_by_token
      token.team.users << self
    end

    def new_company_account_setup
      self.create_account(:name => self.profile.company ).create_team(:name => self.profile.company ).users << self
    end

end
