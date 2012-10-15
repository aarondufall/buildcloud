class InvitesController < ApplicationController
	def show
		@invite = Invite.find_by_token(params[:token])	
	end

	def new
		@account = current_account_memberships.find(params[:account_id])
		@project = current_projects.find(params[:project_id]) 
		@invite = @account.invites.build
	end

	def create
		@account = current_account_memberships.find(params[:account_id])
		@project = current_projects.find(params[:project_id]) 
		@invite = @account.invites.invite_to(@project, params[:invite][:email])
		flash[:notice] = "Invite sent"
		redirect_to [@account, @project]
	end
	
end
