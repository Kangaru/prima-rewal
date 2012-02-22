class FlatpagePresenter < ActionPresenter::Base
  presents :flatpage

  def titles(joiner='/')
    flatpage.translations.map(&:title) * joiner
  end

  def translated_to(joiner='/')
    flatpage.translations.map(&:locale).map {|locale| Language.translate_locale locale } * joiner
  end

  def admin_form_tab(locale, lang)
    link = link_to lang, "#lang-#{locale}"
    content_tag :li, link
  end
end