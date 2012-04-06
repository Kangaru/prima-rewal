class Flatpage::Translation < Globalize::ActiveRecord::Translation
  validates :title, presence: true, length: { minimum: 3, allow_blank: true }
  validates :content, presence: true, length: { minimum: 10, allow_blank: true }

  validates_presence_of :meta_title, :meta_description, :meta_keywords
end