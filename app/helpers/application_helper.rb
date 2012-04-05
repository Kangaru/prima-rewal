module ApplicationHelper
  def main_page_path
    root_url i18n_locale: params[:i18n_locale]
  end

end
