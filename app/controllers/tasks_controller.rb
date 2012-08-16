class TasksController < ApplicationController

	def new
	  @project = current_project
	  @tasklist = @project.tasklists.find(params[:tasklist_id])
	  @task = @tasklist.tasks.build	
	end
end
