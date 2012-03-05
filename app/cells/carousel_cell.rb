class CarouselCell < Cell::Rails

  cache :display, expires_in: 1.hour

  def display
    @cover, *@photos = FbAlbum.carousel
    render
  end

end
