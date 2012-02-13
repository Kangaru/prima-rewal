module LocaleHelper
  def for_locales
    Language.all.each do |locale, lang|
      yield(locale, lang)
    end
  end
end