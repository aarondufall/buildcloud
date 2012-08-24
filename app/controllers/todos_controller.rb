class TodosController < ApplicationController
	def show
		@project = current_project
		@todolist = current_todolists.find(params[:todolist_id])
		@todo = @todolist.todos.find(params[:id])
	end
	
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
			render 'new'
		end
	end

	def edit
		@project = current_project
	  	@todolist = current_todolists.find(params[:todolist_id])
	  	@todo = @todolist.todos.find(params[:id])	
	end

	def update
		@project = current_project
		@todolist = current_todolists.find(params[:todolist_id])
		@todo = @todolist.todos.find(params[:id])
		if @todo.update_attributes(params[:todo])
			flash[:success] = "todo for #{@todolist.name} updated"
			redirect_to [@todolist.project, @todolist, @todo]
		else
			flash[:error] = "Failed"
			render 'new'
		end
	end

	def complete_todo

		@todolist = current_todolists.find(params[:todolist_id])
		@todo = @todolist.todos.find(params[:todo_id])
		@todo.completed_at = DateTime.now
		if @todo.save
			flash[:success] = "To-do Completed"
			redirect_to  [@todolist.project, @todolist]
		else
			flash[:error] = "Error: could not complete to-do"
			redirect_to [@todolist.project, @todolist]
		end
	end

	def incomplete_todo
		@todolist = current_todolists.find(params[:todolist_id])
		@todo = @todolist.todos.find(params[:todo_id])
		@todo.completed_at = nil
		if @todo.save
			flash[:success] = "To-do set to incomplete"
			redirect_to [@todolist.project, @todolist]
		else
			flash[:error] = "Error: could not set to-do to incomplete"
			redirect_to [@todolist.project, @todolist]
		end
	end
end
