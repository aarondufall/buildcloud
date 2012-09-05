class TodolistsController < ApplicationController
	respond_to :html

	def index
		@project = current_project
		@todolists = current_todolists.all
	end

	def show
		@project = current_project
		@todolist = current_todolists.find(params[:id])
		if completed_todos?
			@todos = @todolist.todos.completed
		else
			@todos = @todolist.todos.incomplete
		end
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
			redirect_to [@todolist.project, @todolist]
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

	def completed_todos?
		params[:filter] == 'completed'
	end

	def active_todos?
		params[:filter] != 'completed'
	end

	helper_method :completed_todos?, :active_todos?

end
