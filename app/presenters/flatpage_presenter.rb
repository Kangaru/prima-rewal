class FlatpagePresenter < ActionPresenter::Base
  include Presenters::Markdown

  presents :flatpage
  delegate :title, to: :flatpage


  let(:titles) {|joiner='/'| flatpage.translations.map(&:title) * joiner }
  let(:sortable_titles) { content_tag :span, titles, data: { id: flatpage.id }, class: :sortable_title  }

  let(:content) do
    markdown Widget.new(flatpage.content, self).widgetize
  end

  let(:translated_to) {|joiner='/'| flatpage.translations.map(&:locale).map {|locale| Language.translate_locale locale } * joiner }

  let(:admin_form_tab) {|locale, lang| content_tag :li, link_to(lang, "#lang-#{locale}") }
end