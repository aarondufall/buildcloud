class RegistrationsController < Devise::RegistrationsController
	def new
     @invite = Invite.find(session[:invite]) if session[:invite]
     resource = build_resource({})
     respond_with resource
  end

  # POST /resource
  def create
  	if session[:invite]
      @invite = Invite.find(session[:invite])
      @user = @invite.account.users.build(params[:user])
    else
      @user = User.new(params[:user])
      @account = @user.build_account
      @account.name = params[:user][:profile_attributes][:company]
    end
    if @user.save
      @account.give_user_access(@user)
      @user.active_for_authentication?
      set_flash_message :notice, :signed_up if is_navigational_format?
      sign_in(resource_name, @user)
      respond_with @user, :location => after_sign_up_path_for(@user)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

end
