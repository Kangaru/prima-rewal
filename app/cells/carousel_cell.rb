class CarouselCell < Cell::Rails

  def display
    @cover, *@photos = FbAlbum.carousel
    render
  end

end
