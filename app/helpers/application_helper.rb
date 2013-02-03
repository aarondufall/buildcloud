module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
      base_title = "Build Cloud"
      if page_title.empty?
          base_title
      else
        "#{base_title} | #{page_title}"
      end
  end

  def navbar_entry(active = false, &block)
    options = {}
    options[:class] = "active" if active
    content_tag :li, capture(&block), options
  end

  def relative_date(from, relative_to = Time.now)
    duration_text = distance_of_time_in_words relative_to, from
    content_tag :abbr, duration_text, :class => "relative-date", :title => l(from, :format => :long)
  end

end
