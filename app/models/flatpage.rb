class Flatpage < ActiveRecord::Base
  acts_as_list

  translates :title, :content
  globalize_accessors
  accepts_nested_attributes_for :translations

  after_initialize :setup_translations

  def self.for_main_page
    order_by_position.first
  end

  def self.for_menu
    order_by_position.includes(:translations)
  end

  def setup_translations
    if new_record? && translations.empty?
      Language.available_locales.each do |locale|
        translations.find_or_initialize_by_locale(locale)
      end
    end
  end

  def self.update_positions(ids)
    ids.each_with_index do |id, index|
      update_position id, index.to_i + 1
    end
  end


private

  def self.order_by_position(order = 'ASC')
    order("position #{order}")
  end

  def self.update_position(id, pos)
    where('id == ? AND position != ?', id, pos).limit(1).update_all position: pos
  end
end
