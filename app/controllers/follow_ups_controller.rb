class FollowUpsController < ApplicationController
	def create
		@issue = current_project.issues.find(params[:issue_id])
		@follow_up = @issue.follow_ups.build(params[:issue])
		@follow_up.followed_up_by = current_user
		if @follow_up.save
			IssueMailer.issue_notice(@issue).deliver
			flash[:sucess] = "A follow up e-mail has been sent for this issue"
		else
			flash[:error] = "failed"
		end
		redirect_to account_project_issue_url(current_account, current_project, params[:issue_id])
	end
end
