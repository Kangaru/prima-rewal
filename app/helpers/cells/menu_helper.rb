module Cells::MenuHelper
  def menu_link(object, path, options = {})
    active = active_link? path
    content_tag :li, link_to(object.title, path, options), class: active, id: "#{object.class.to_s.downcase}_#{object.id}"
  end

private

  def active_link?(path)
    :active if current_page? path
  end
end