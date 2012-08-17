class ProjectsController < ApplicationController
	respond_to :html

	def index
		@projects = current_projects.all
	end

	def show
		@project = current_projects.find(params[:id])
		@todolists = @project.todolists
	end

	def new
		@team    = current_user.owned_team
		@project = @team.projects.build
	end

	def create
		@team    = current_user.owned_team
		@project = @team.projects.build(params[:project])
		if @project.save
			flash[:success] = "Added new project #{@project.name}"
			redirect_to projects_path
		else
			render 'new'
		end
	end


	def edit
		@project = current_projects.find(params[:id])
		respond_with @project
	end

	def update
		@project = current_projects.find(params[:id])
		if @project.update_attributes(params[:project])
			flash[:success] = "project sucessfully updated"
			redirect_to projects_path
		else
			flash[:error] = "project failed to update"
			render 'edit'
		end
	end

	def destroy
		current_projects.find(params[:id]).destroy
		flash[:success] = "Project deleteed."
  	redirect_to projects_path
	end

end
