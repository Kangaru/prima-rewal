class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    return redirect_to "/#{I18n.default_locale}" unless params[:locale]
    I18n.locale = params[:locale]
  end

  def default_url_options(options={})
    options.merge({ locale: I18n.locale })
  end
end
