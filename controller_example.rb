def show
  user = invite.account.users.build email: invite.email
end

def update
  user = invite.account.users.build params[:user]
  if user.save
    invite.accept_as user
    redirect_to :root
  else
    render :show
  end
end

protected

def invite
  @invite ||= Invite.find_by_token!(params[:token])
end