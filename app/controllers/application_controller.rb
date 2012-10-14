class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_account
 

  private

  def current_teams
    current_user.teams
  end

  def current_account_memberships
    Account.accessible_by(current_user)
  end

  def current_account
    #need to refactor to be able to select accounts for project creation
    current_account_memberships.first
  end

  def current_projects
    Project.accessible_by(current_user)
  end

  def current_project
		@current_project ||= current_projects.find(params[:project_id])
	end

  def current_worklists
    current_project.worklists
  end

  def after_sign_in_path_for(resource)
    projects_path
  end

  def post_creation_path(project, worklist)
    case params[:from]
    when "projects"    then account_project_path(current_account, project)
    when "worklists" then account_project_worklists_path(current_account, project)
    else account_project_worklist_path(current_account, project, worklist)
    end
  end

end
