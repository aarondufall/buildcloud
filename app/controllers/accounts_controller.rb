class AccountsController < ApplicationController
	def show
		@members = current_account.users
	end
end
