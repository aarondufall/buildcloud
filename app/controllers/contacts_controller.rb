class ContactsController < ApplicationController
	def index
		@contacts = current_account.contacts	
	end

	def new
		@contact = current_account.contacts.build
	end

	def create
		@contact = current_account.contacts.build(params[:contact])
		if @contact.save
			flash[:success] = 'New Contact Added'
			redirect_to [current_account, :contacts]
		else
			flash[:error] = 'Fails to Add Contact'
			render 'new'
		end
	end
end
