module ProjectsHelper

  def render_project_menu(project)
    render partial: 'shared/menu', locals: {project: project}
  end

  def formatted_todolist_end_date(todolist)
    date          = todolist.end_date
    duration_text = relative_date(date, Time.now.to_date)
    output        = ActiveSupport::SafeBuffer.new
    if date.future?
      output << content_tag(:span, duration_text, :class => "date")
      output << " Until schedule completion date"
    else
      output << "Was due for completion"
      output << content_tag(:span, duration_text, :class => "date overdue")
      output << " ago"
    end
    output
  end

  def relative_date(from, relative_to = Time.now)
    duration_text = distance_of_time_in_words relative_to, from
    content_tag :abbr, duration_text, :class => "relative-date", :title => l(from, :format => :long)
  end

end
