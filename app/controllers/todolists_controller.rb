class TodolistsController < ApplicationController
	respond_to :html

	def index
		@project = current_project
		@todolists = current_todolists.all
	end

	def show
		@project = current_project
		@todolist = current_todolists.find(params[:id])
	end

	def new
		@todolist = current_todolists.build
	end

	def create
		@todolist = current_todolists.build(params[:todolist])
		if @todolist.save
			flash[:success] = "Added new todolist #{@todolist.name} created"
			redirect_to current_project
		else
			render 'new'
		end
	end

	def edit
		@todolist = current_todolists.find(params[:id])
		respond_with @todolist
	end

	def update
		@todolist = current_todolists.find(params[:id])
		if @todolist.update_attributes(params[:todolist])
			flash[:success] = "List sucessfully updated"
			if redirect_to_project?
				redirect_to @todolist.project
			else
				redirect_to [@todolist.project, :todolists]
			end
		else
			flash[:error] = "List failed to update"
			render 'edit'
		end
	end

	def destroy
		current_todolists.find(params[:id]).destroy
		flash[:success] = "List deleted."
		redirect_to current_project
	end

	private

	def redirect_to_project?
		params[:from] == 'project'
	end

	

	

end
