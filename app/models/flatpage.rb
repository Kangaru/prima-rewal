class Flatpage < ActiveRecord::Base
  translates :title, :content
  accepts_nested_attributes_for :translations
  globalize_accessors

  validates :title, presence: true, length: { minimum: 3, allow_nil: true }
  validates :content, presence: true, length: { minimum: 10, allow_nil: true }
end
