require 'ostruct'

def flatpage(locale)
  title = "Lorem ipsum #{locale}"
  content = "#{locale} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl mi, accumsan eu varius ac, facilisis in justo. Cras ipsum."

  OpenStruct.new({title: title, content: content})
end