class ProjectsController < ApplicationController
	def index
		@projects = current_user.owned_team.projects
		
	end


	def new
		@project = Project.new
	end

	def create
		@project = Project.create(params[:project])
		@project.team = current_user.owned_team
		@project.save
		flash[:success] = "#{@project.name}"
		
		redirect_to projects_path
	end



end
