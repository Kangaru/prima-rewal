class ApplicationController < ActionController::Base
  protect_from_forgery

  has_widgets do |root|
    root << widget(:reservation_form)
  end

  def set_admin_locale
    I18n.locale = I18n.default_locale
  end
end
