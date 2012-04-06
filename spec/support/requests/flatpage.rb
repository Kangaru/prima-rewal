require 'ostruct'

def flatpage(locale)
  title = "Lorem ipsum #{locale}"
  content = "#{locale} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl mi, accumsan eu varius ac, facilisis in justo. Cras ipsum."

  meta_title       = "Meta title #{locale}"
  meta_description = "Meta description #{locale}"
  meta_keywords    = "Meta keywords #{locale}"

  OpenStruct.new({
    title: title, content: content,
    meta_title: meta_title, meta_description: meta_description, meta_keywords: meta_keywords
  })
end