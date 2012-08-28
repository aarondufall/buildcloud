class TeamsController < ApplicationController

	def index
		@teams = current_teams
	end


	
end
