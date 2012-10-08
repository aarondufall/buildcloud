class TodosController < ApplicationController
	def show
		@project = current_project
		@worklist = current_worklists.find(params[:worklist_id])
		@todo = @worklist.todos.find(params[:id])
	end

	def new
	  	@project = current_project
	 	@worklist = current_worklists.find(params[:worklist_id])
	  	@todo = @worklist.todos.build
	end

	def create
		@project = current_project
		@worklist = current_worklists.find(params[:worklist_id])
		@todo = @worklist.todos.build(params[:todo])
		@todo.created_by = current_user
		if @todo.save
			flash[:success] = "Added new todo to #{@worklist.name} created"
			redirect_to post_creation_path(@project, @worklist)
		else
			render 'new'
		end
	end

	def edit
		@project = current_project
	  	@worklist = current_worklists.find(params[:worklist_id])
	  	@todo = @worklist.todos.find(params[:id])
	end

	def update
		@project = current_project
		@worklist = current_worklists.find(params[:worklist_id])
		@todo = @worklist.todos.find(params[:id])
		if @todo.update_attributes(params[:todo])
			flash[:success] = "todo for #{@worklist.name} updated"
			redirect_to [@worklist.project, @worklist, @todo]
		else
			flash[:error] = "Failed"
			render 'new'
		end
	end

	def complete_todo
		@worklist = current_worklists.find(params[:worklist_id])
		@todo     = @worklist.todos.find(params[:todo_id])
		if @todo.complete!
			flash[:success] = "To-do Completed"
		else
			flash[:error] = "Error: could not complete to-do"
		end
		redirect_to :back
	end

	def incomplete_todo
		@worklist = current_worklists.find(params[:worklist_id])
		@todo     = @worklist.todos.find(params[:todo_id])
		if @todo.incomplete!
			flash[:success] = "To-do set to incomplete"
		else
			flash[:error] = "Error: could not set to-do to incomplete"
		end
		redirect_to :back
	end



	

end
