module LocalizedController
  extend ActiveSupport::Concern

  included do
    before_filter :set_locale
  end

  def set_locale
    I18n.locale = params[:i18n_locale]
  end

  def default_url_options(options={})
    { i18n_locale: I18n.locale }
  end
end