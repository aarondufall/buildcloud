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

end
