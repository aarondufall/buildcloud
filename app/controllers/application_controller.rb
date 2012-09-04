class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_team
 

  private

  def current_teams
    current_user.teams
  end

  def current_team
    current_user.account.team
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

  def post_creation_path(project, todolist)
    case params[:from]
    when "projects"    then project_path(project)
    when "todolists" then project_todolists_path(project)
    else project_todolist_path(project, todolist)
    end
  end

end
