class FacebookLikeBoxCell < Cell::Rails

  cache :display, expires_in: 1.hour do
    I18n.locale
  end

  def display
    @options = {
      href: 'http://facebook.com/PrimaRewal',
      width: 100, height: 64,
      send: false, layout: :box_count, 'show-faces' => false,
    }

    render
  end

end
