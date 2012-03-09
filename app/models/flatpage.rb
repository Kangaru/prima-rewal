class Flatpage < ActiveRecord::Base
  acts_as_list

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


  class << self
    def for_main_page
      order_by_position.first
    end

    def for_menu
      order_by_position.includes(:translations)
    end
    alias_method :fetch_all, :for_menu


  private

    def order_by_position
      order('position ASC')
    end
  end

  class << self
    def update_positions(ids)
      ids.each_with_index do |id, index|
        update_position id.to_i, index.to_i + 1
      end
    end


  private

    def update_position(id, position)
      flatpage = where('id == ? AND position != ?', id, position).limit(1).first
      flatpage.update_attributes(position: position) if flatpage
    end
  end


  def to_param
    [id, title.to_url].join '-'
  end

  def self.expiration_code(path)
    [I18n.locale, "#{path}"[1..-1].gsub(/^(I18n.available_locales * '|')/, '')]
  end
end
