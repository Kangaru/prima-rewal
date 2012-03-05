class FacebookGalleryCell < Cell::Rails
  include ActionPresenter::ViewHelper

  cache :display, expires_in: 1.hour

  def display
    @cover, *@photos = FbAlbum.gallery
    render
  end

end