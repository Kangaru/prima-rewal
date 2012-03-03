def set_to_default_locale
  Rails.application.routes.default_url_options[:i18n_locale] = I18n.default_locale
end

set_to_default_locale

module AdminRequestsSpecsOptions
  extend ActiveSupport::Concern

  included do
    before :all do
      Rails.application.routes.default_url_options = {}
    end

    after :all do
      set_to_default_locale
    end
  end
end