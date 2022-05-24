module ApplicationHelper
  def markdown(text)
    return "" if text.nil?
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(text.to_s, *options).to_html.html_safe
  end
end
