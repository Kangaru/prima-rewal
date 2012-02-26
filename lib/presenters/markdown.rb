require 'redcarpet/compat'

module Presenters::Markdown

private

  @markdown_options = [:filter_html, :hard_wrap, :autolink, :tables]
  attr_accessor :markdown_options

  def markdown(text)
    Markdown.new(text, markdown_options).to_html.html_safe
  end
end