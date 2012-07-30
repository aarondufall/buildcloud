class UsersController < ApplicationController


	def index
		@search = User.search do
    		fulltext params[:search]
    		paginate :page => params[:page], :per_page => 20
    	end
		@users = @search.results
	end

	def add_to_team
		@new_member = User.find(params[:id])
		if current_user.owned_team.users << @new_member
			flash[:success] = "User sucessfully added to team"
			redirect_to teams_path
		else
			flash[:error] = "This user is aready part of your team"
			redirect_to users_path
		end
	end

	def remove_from_team
		@remove_member = User.find(params[:id])
		current_user.owned_team.users.delete(@remove_member)
		flash[:success] = "User sucessfully been removed from team"
		redirect_to teams_path
	end
end
