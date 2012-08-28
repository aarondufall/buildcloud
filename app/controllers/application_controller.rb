class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_team

  private

  def current_teams
    current_user.teams
  end

  def current_projects
    current_user.projects
  end

  def current_project
		@current_project ||= current_projects.find(params[:project_id])
	end

  def current_todolists
    current_project.todolists
  end

  def after_sign_in_path_for(resource)
    projects_path
  end

end
