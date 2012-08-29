class ContactsController < ApplicationController
	def index
		@contacts = current_team.contacts	
	end

	def new
		@contact = current_team.contacts.build
	end

	def create
		@contact = current_team.contacts.build(params[:contact])
		if @contact.save
			flash[:success] = 'New Contact Added'
			redirect_to [current_team, :contacts]
		else
			flash[:error] = 'Fails to Add Contact'
			render 'new'
		end
	end
end
