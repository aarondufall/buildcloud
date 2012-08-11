class TeamsController < ApplicationController

	def index
		@teams = Team.all
		@own_team = current_team
	end


	
end
