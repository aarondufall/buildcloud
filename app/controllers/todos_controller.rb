class TodosController < ApplicationController

	def new
	  @project = current_project
	  @todolist = current_todolists.find(params[:todolist_id])
	  @todo = @todolist.todos.build	
	end

	def create
		@project = current_project
		@todolist = current_todolists.find(params[:todolist_id])
		@todo = @todolist.todos.build(params[:todo])
		if @todo.save
			flash[:success] = "Added new todo to #{@todolist.name} created"
			redirect_to current_project
		else
			flash[:error] = "Failed"
			render 'new'
		end
	end
end
