class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	respond_to :html

	def index
		@projects = current_projects
	end

	def show
		@project = current_projects.find(params[:id])
		@worklists = @project.worklists
	end

	def new
		@account    = current_account
		@project = @account.projects.build
	end

	def create
		@account = current_account
		@project = @account.projects.build(params[:project])
		if @project.save
			@project.give_user_access(current_user)
			flash[:success] = "Added new project #{@project.name}"
			redirect_to @project
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
