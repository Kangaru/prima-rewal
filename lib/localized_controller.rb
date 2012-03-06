module LocalizedController
  extend ActiveSupport::Concern

  included do
    include LocalizedController::SetLocale
    include LocalizedController::DefaultUlrOptions
    before_filter :set_locale
  end

  module SetLocale
    def set_locale
      I18n.locale = cookies['i18n_locale'] || params[:i18n_locale] || I18n.default_locale
    end
  end

  module DefaultUlrOptions
    def default_url_options(options={})
      { i18n_locale: params[:i18n_locale] }
    end
  end
end