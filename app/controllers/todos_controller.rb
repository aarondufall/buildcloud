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
			redirect_to post_creation_path(@project, @todolist)
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
		@todo     = @todolist.todos.find(params[:todo_id])
		if @todo.complete!
			flash[:success] = "To-do Completed"
		else
			flash[:error] = "Error: could not complete to-do"
		end
		redirect_to :back
	end

	def incomplete_todo
		@todolist = current_todolists.find(params[:todolist_id])
		@todo     = @todolist.todos.find(params[:todo_id])
		if @todo.incomplete!
			flash[:success] = "To-do set to incomplete"
		else
			flash[:error] = "Error: could not set to-do to incomplete"
		end
		redirect_to :back
	end

	private

	def post_creation_path(project, todolist)
		case params[:from]
		when "projects" 	 then project_path(project)
		when "todolists" then project_todolists_path(project)
		else project_todolist_path(project, todolist)
		end
	end

end
