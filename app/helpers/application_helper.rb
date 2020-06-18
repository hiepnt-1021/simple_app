module ApplicationHelper
  #khai bao phuong thuc helper display the title
  def full_title page_title = ""
    base_title = "Ruby on Rails Tutorial Sample App"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
