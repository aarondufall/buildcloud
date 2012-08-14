class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_team


  private

  def current_team
    current_user.owned_team
  end

 

end
