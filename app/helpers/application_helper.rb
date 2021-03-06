module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Dominican Music in the US"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # Highlight current page in nav
  def nav_link(link_text, link_path, title='')
    class_name = 'active' if request.url.include?(link_path)
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path, class: 'nav-link', title: title
    end
  end

end

