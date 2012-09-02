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
		@issue = @project.issues.build
		if params[:todo_id].nil?
			flash[:notice] = "true #{params}"
		else
			flash[:notice] = "fail"
		end
		redirect_to root_path
	end
end
