class FollowUpsController < ApplicationController
	def new
		@project = current_project
		@issue = @project.issues.find(params[:issue_id])
	end
end
