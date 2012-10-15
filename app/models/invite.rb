class Invite < ActiveRecord::Base
  before_create :generate_invite_token
  belongs_to :target, polymorphic: true
  belongs_to :account
  attr_accessible :email, :token, :target

  # Creating an invite:
  # account.invites.invite_to project, "test@example.com"

  def self.invite_to(invite_to, email)
    create target: invite_to, email: email
    #generate token
  end

  def generate_invite_token
    generate_unique_field! :token, 32 if token.blank?
  end


  # Creating user:
  # user = invite.account.users.create(params[:user])

  def accept_as(user)
    target.give_user_access user
    destroy
  end

end
