class GoogleMapsCell < Cell::Rails

  cache :display, expires_in: 1.hour

  def display
    render
  end

end
