class Invite < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  belongs_to :account
  attr_accessible :email, :token, :target

  # Creating an invite:
  # account.invites.invite_to project, "test@example.com"

  def self.invite_to(invite_to, email)
    create target: invite_to, email: email
    #generate token
  end

  # Creating user:
  # user = invite.account.users.create(params[:user])

  def accept_as(user)
    target.give_user_access user
    destroy
  end

end
