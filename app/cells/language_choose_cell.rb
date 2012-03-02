class LanguageChooseCell < Cell::Rails

  def display
    @languages = Language.available_locales
    render
  end

end
