class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_team

  private

  def current_team
    current_user.owned_team
  end

  def current_projects
    current_user.projects
  end

end
