class FacebookLikeBoxCell < Cell::Rails

  cache :display, expires_in: 1.hour do
    I18n.locale
  end

  def display
    @options = {
      href: "http://facebook.com/primarewal",
      send: false, layout: :button_count,
      width: 101, 'show-faces' => false
    }

    render
  end

end
