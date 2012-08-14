class TasklistsController < ApplicationController
	def index
		@project = current_project(params[:project_id])
		@tasklists = @project.tasklists
	end

	def new
		@tasklist = current_project(params[:project_id]).tasklists.build
	end

	def create
		@tasklist = current_project(params[:project_id]).tasklists.build(params[:tasklist])
		if @tasklist.save
			flash[:success] = "Added new tasklist #{@tasklist.name} created"
			redirect_to project_path(params[:project_id])
		else
			render 'new'
		end	
	end

	private

	def current_project(project)
		Project.find(project)
	end
end
