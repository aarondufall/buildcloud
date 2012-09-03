class IssuesController < ApplicationController

	def index
		@project = current_project
		@issues = @project.issues	
	end


	def new
		@project = current_project
	  	@issue = @project.issues.build		
	end

	def create
		@project = current_project
		@issue = @project.issues.build(params[:issue])
		@issue.created_by = current_user
		unless params[:todo_id].empty?
			@todo = @project.todos.find(params[:todo_id])
			@issue.todo = @todo
		end
			
		if @issue.save
			flash[:success] = "Issue successfully logged"
			redirect_to project_issues_path
		else
			render 'new'
		end
	end
end
