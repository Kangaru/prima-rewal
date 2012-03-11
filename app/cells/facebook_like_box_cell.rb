class FacebookLikeBoxCell < Cell::Rails

  cache :display, expires_in: 1.hour do
    I18n.locale
  end

  def display
    @options = {
      href: 'http://facebook.com/PrimaRewal',
      width: 50, height: 20,
      send: false, layout: :button_count, 'show-faces' => false,
    }

    render
  end

end
