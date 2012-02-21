class Flatpage < ActiveRecord::Base
  translates :title, :content
  globalize_accessors
  accepts_nested_attributes_for :translations

  after_initialize :setup_translations

  def setup_translations
    if new_record? && translations.empty?
      Language.available_locales.each do |locale|
        translations.find_or_initialize_by_locale(locale)
      end
    end
  end
end
