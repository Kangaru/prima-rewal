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

  def localized_title_input(locale, options={})
    localized_input :"title_#{locale}", options.merge(label: t('flatpage.title'))
  end

  def localized_content_input(locale, options={})
    localized_input :"content_#{locale}", options.merge(as: :text, label: t('flatpage.content'))
  end

  def localized_input(label, options={})
    form = options.delete(:form)

    form.input label, options
  end
end