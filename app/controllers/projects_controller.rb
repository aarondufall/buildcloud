class ProjectsController < ApplicationController
	respond_to :html

	def index
		@projects = current_projects.all
	end

	def show
		@project = current_projects.find(params[:id])
		@tasklists = @project.tasklists
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


	def edit
		@project = Project.find(params[:id])
		respond_with @project
	end	

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			flash[:success] = "project sucessfully updated"
			redirect_to projects_path
		else
			flash[:error] = "project failed to update"
			render 'edit'
		end
	end

	def destroy
		if Project.find(params[:id]).destroy
    		flash[:success] = "Project deleteed."
    		redirect_to projects_path
    	else
    		flash[:error] = "project failed to delete"
    		redirect_to projects_path
    	end
	end


	private

	def current_projects
		current_team.projects
	end

end
