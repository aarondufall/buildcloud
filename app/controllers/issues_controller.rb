class IssuesController < ApplicationController

	def new
		@project = current_project
	 	@todolist = current_todolists.find(params[:todolist_id])
	  	@todo = @todolist.todos.find(params[:todo_id])
	  	@issue = @todo.issues.build
		
	end


end
