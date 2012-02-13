class Language
  def self.all
    Hash[*available_locales.map {|locale| [locale, translate_locale(locale)]}.flatten]
  end


  def self.translate_locale(locale)
    I18n.t(locale, scope: :locales)
  end

  def self.available_locales
    [:pl, :en, :de]
  end

  def self.default_locale
    :pl
  end
end