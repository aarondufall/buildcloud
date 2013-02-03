module WorklistsHelper

def formatted_worklist_end_date(worklist)
    date          = worklist.end_date
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

  

  def render_worklists(worklists)
  	render partial: 'worklists/worklists', locals: {worklists: worklists}
  end

end
