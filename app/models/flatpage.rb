class Flatpage < ActiveRecord::Base
  translates :title, :content
  globalize_accessors

  ::Language.all.each do |lang, _|
    validates :"title_#{lang}", presence: true, length: { minimum: 3, allow_blank: true }
    validates :"content_#{lang}", presence: true, length: { minimum: 10, allow_blank: true }
  end
end
