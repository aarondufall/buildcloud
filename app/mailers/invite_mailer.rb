class InviteMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invite(invite)
  	@invite = invite
  	mail(:to => invite.email, :subject => "You've been invited to #{invite.target.name}")
  end
end
