class IssuesController < ApplicationController

	def index
		@project = current_project
		@issues = @project.issues
	end


	def show
		@project = current_project
		@issue = @project.issues.find(params[:id])
	end

	def new
		@project = current_project
	  @issue = @project.issues.build
	end

	def create
		@project = current_project
		@issue = @project.issues.build
		@issue.attributes = params[:issue]
		@issue.created_by = current_user
		unless params[:todo_id].empty?
			@todo = @project.todos.find(params[:todo_id])
			@issue.todo = @todo
		end

		if @issue.save
			flash[:success] = "Issue successfully logged"
			redirect_to project_issue_path(@project, @issue)
		else
			render 'new'
		end
	end


	def close_issue
		@project = current_project
		@issue = @project.issues.find(params[:issue_id])
		if @issue.close!
			flash[:success] = "Issue closed"
		else
			flash[:error] = "Error: could not close issue"
		end
		redirect_to :back
	end

	def reopen_issue
		@project = current_project
		@issue = @project.issues.find(params[:issue_id])
		if @issue.reopen!
			flash[:success] = "Issue reopend"
		else
			flash[:error] = "Error: could not set issue open"
		end
		redirect_to :back
	end
end
