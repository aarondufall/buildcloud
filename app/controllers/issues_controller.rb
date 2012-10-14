class IssuesController < ApplicationController

	def index
		@project = current_project
		if closed_issues?
			@issues = @project.issues.closed
		else
			@issues = @project.issues.opened
		end
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
		unless params[:item_id].empty?
			@item = @project.items.find(params[:item_id])
			@issue.item = @item
		end

		if @issue.save
			flash[:success] = "Issue successfully logged"
			redirect_to account_project_issue_path(current_account, @project, @issue)
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

	def closed_issues?
		params[:filter] == 'closed'
	end

	def open_issues?
		params[:filter] != 'closed'
	end

	helper_method :closed_issues?, :open_issues?
end
