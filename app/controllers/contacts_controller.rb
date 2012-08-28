class ContactsController < ApplicationController
	def index
		@contacts = current_team.contacts	
	end
end
