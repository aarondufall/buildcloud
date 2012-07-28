class TeamsController < ApplicationController

	def index
		@teams = Team.all
		@own_team = current_user.owned_team
	end

	def update

		
	end

	
end
