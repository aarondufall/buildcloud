class RegistrationsController < Devise::RegistrationsController

	def new
    if session[:invite] 
      @invite = Invite.find(session[:invite])
    end 
    resource = build_resource({})
    respond_with resource
  end

  # POST /resource
  def create

    build_resource
    if session[:invite] 
      @invite = Invite.find(session[:invite])
      @account = @invite.account
    else
      @account = resource.build_account
      @account.name = params[:user][:profile_attributes][:company]
    end
    if resource.save
      @account.give_user_access(resource)
      add_to_project(@invite, @user) unless false
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

    def add_to_project(invite, user)
      return false unless invite != nil
      invite.accept_as(user)
    end
end
