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

  def current_project
		@current_project ||= current_projects.find(params[:project_id])
	end

end
