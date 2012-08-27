module ProjectsHelper

  def render_project_menu(project)
    render partial: 'shared/menu', locals: {project: project}
  end

  

end
