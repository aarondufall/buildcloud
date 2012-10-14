class ItemsController < ApplicationController
	def show
		@project = current_project
		@worklist = current_worklists.find(params[:worklist_id])
		@item = @worklist.items.find(params[:id])
	end

	def new
	  	@project = current_project
	 	@worklist = current_worklists.find(params[:worklist_id])
	  	@item = @worklist.items.build
	end

	def create
		@project = current_project
		@worklist = current_worklists.find(params[:worklist_id])
		@item = @worklist.items.build(params[:item])
		@item.created_by = current_user
		if @item.save
			flash[:success] = "Added new item to #{@worklist.name}"
			redirect_to post_creation_path(@project, @worklist)
		else
			render 'new'
		end
	end

	def edit
		@project = current_project
	  	@worklist = current_worklists.find(params[:worklist_id])
	  	@item = @worklist.items.find(params[:id])
	end

	def update
		@project = current_project
		@worklist = current_worklists.find(params[:worklist_id])
		@item = @worklist.items.find(params[:id])
		if @item.update_attributes(params[:item])
			flash[:success] = "item for #{@worklist.name} updated"
			redirect_to [current_account, @worklist.project, @worklist, @item]
		else
			flash[:error] = "Failed"
			render 'new'
		end
	end

	def complete_item
		@worklist = current_worklists.find(params[:worklist_id])
		@item     = @worklist.items.find(params[:item_id])
		if @item.complete!
			flash[:success] = "To-do Completed"
		else
			flash[:error] = "Error: could not complete to-do"
		end
		redirect_to :back
	end

	def incomplete_item
		@worklist = current_worklists.find(params[:worklist_id])
		@item     = @worklist.items.find(params[:item_id])
		if @item.incomplete!
			flash[:success] = "To-do set to incomplete"
		else
			flash[:error] = "Error: could not set to-do to incomplete"
		end
		redirect_to :back
	end



	

end
