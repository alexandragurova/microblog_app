module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title ='')
    default_title = "Microblog App"
    if page_title.empty?
      default_title
    else
      "#{page_title} | #{default_title}"
    end
  end
end
