class FacebookLikeBoxCell < Cell::Rails

  cache :display, expires_in: 1.hour

  def display
    @options = {
      href: "http://facebook.com/primarewal",
      width: 240, height: 80,
      'show-faces' => false,
      stream: false, header: false,
      'border-color' => '#ffffff'
    }

    render
  end

end
