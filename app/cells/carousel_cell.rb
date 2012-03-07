class CarouselCell < Cell::Rails

  cache :display

  def display
    @cover, *@photos = FbAlbum.carousel
    render
  end

end
