class WorklistsController < ApplicationController
	respond_to :html

	def index
		@project = current_project
		@worklists = current_worklists.all
	end

	def show
		@project = current_project
		@worklist = current_worklists.find(params[:id])
		if completed_items?
			@items = @worklist.items.completed
		else
			@items = @worklist.items.incomplete
		end
	end

	def new
		@worklist = current_worklists.build
	end

	def create
		@worklist = current_worklists.build(params[:worklist])
		if @worklist.save
			flash[:success] = "Added new worklist #{@worklist.name} created"
			redirect_to [current_account, current_project]
		else
			render 'new'
		end
	end

	def edit
		@worklist = current_worklists.find(params[:id])
		respond_with @worklist
	end

	def update
		@worklist = current_worklists.find(params[:id])
		if @worklist.update_attributes(params[:worklist])
			flash[:success] = "List sucessfully updated"
			redirect_to [current_account, @worklist.project, @worklist]
		else
			flash[:error] = "List failed to update"
			render 'edit'
		end
	end

	def destroy
		current_worklists.find(params[:id]).destroy
		flash[:success] = "List deleted."
		redirect_to current_project
	end

	def completed_items?
		params[:filter] == 'completed'
	end

	def active_items?
		params[:filter] != 'completed'
	end

	helper_method :completed_items?, :active_items?

end
