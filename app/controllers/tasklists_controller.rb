class TasklistsController < ApplicationController
	respond_to :html

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

	def edit
		@tasklist = Tasklist.find(params[:id])
		respond_with @tasklist
	end	

	def update
		@tasklist = Tasklist.find(params[:id])
		if @tasklist.update_attributes(params[:tasklist])
			flash[:success] = "List sucessfully updated"
			redirect_to project_path(@tasklist.project)
		else
			flash[:error] = "List failed to update"
			render 'edit'
		end
	end

	def destroy
		if Tasklist.find(params[:id]).destroy
    		flash[:success] = "List deleted."
    		redirect_to project_path(current_project(params[:project_id]))
    	else
    		flash[:error] = "List failed to delete"
    		redirect_to project_path(current_project(params[:project_id]))
    	end
	end

	private

	def current_project(project)
		Project.find(project)
	end
end
