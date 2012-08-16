class TasklistsController < ApplicationController
	respond_to :html

	def index
		@project = current_project
		@tasklists = current_tasklists.all
	end

	def new
		@tasklist = current_tasklists.build
	end

	def create
		@tasklist = current_tasklists.build(params[:tasklist])
		if @tasklist.save
			flash[:success] = "Added new tasklist #{@tasklist.name} created"
			redirect_to current_project
		else
			render 'new'
		end
	end

	def edit
		@tasklist = current_tasklists.find(params[:id])
		respond_with @tasklist
	end

	def update
		@tasklist = current_tasklists.find(params[:id])
		if @tasklist.update_attributes(params[:tasklist])
			flash[:success] = "List sucessfully updated"
			if redirect_to_project?
				redirect_to @tasklist.project
			else
				redirect_to [@tasklist.project, :tasklists]
			end
		else
			flash[:error] = "List failed to update"
			render 'edit'
		end
	end

	def destroy
		current_tasklists.find(params[:id]).destroy
		flash[:success] = "List deleted."
		redirect_to current_project
	end

	private

	def redirect_to_project?
		params[:from] == 'project'
	end

	

	def current_tasklists
		current_project.tasklists
	end

end
