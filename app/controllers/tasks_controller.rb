class TasksController < ApplicationController

	def new
	  @project = current_project
	  @tasklist = current_tasklists.find(params[:tasklist_id])
	  @task = @tasklist.tasks.build	
	end

	def create
		@project = current_project
		@tasklist = current_tasklists.find(params[:tasklist_id])
		@task = @tasklist.tasks.build(params[:task])
		if @task.save
			flash[:success] = "Added new task to #{@tasklist.name} created"
			redirect_to current_project
		else
			flash[:error] = "Failed"
			render 'new'
		end
	end
end
