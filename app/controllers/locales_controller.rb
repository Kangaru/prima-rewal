class LocalesController < ApplicationController
  include LocalizedController::DefaultUlrOptions

  def update
    cookies.permanent[:i18n_locale] = params[:i18n_locale] || I18n.default_locale
    I18n.locale = params[:i18n_locale]

    if params[:slug]
      redirect_to flatpage_path(Flatpage.find(params[:slug]))
    else
      redirect_to root_path
    end
  end
end