class ProjectsController < ApplicationController

	def index
		@projects = current_projects.all
	end

	def show
		@project = current_projects.find(params[:id])
	end

	def new
		@project = current_projects.build
	end

	def create
		@project = current_projects.build(params[:project])
		if @project.save
			flash[:success] = "Added new project #{@project.name}"
			redirect_to projects_path
		else
			render 'new'
		end
	end

	private

	def current_projects
		current_team.projects
	end

end
