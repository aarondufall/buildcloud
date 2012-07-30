class ProfilesController < ApplicationController
	respond_to :html

	def edit
		@profile = Profile.find(params[:id])
    	respond_with @profile
	end

	def update
		@profile = Profile.find(params[:id])
		if @profile.update_attributes(params[:profile])
			flash[:success] = "Profile sucessfully updated"
			redirect_to root_path
		else
			flash[:error] = "Profile failed to update"
			render 'edit'
		end

	end
end
