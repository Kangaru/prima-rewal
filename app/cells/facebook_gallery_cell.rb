class FacebookGalleryCell < Cell::Rails
  include ActionPresenter::ViewHelper

  cache :display

  def display
    @cover, *@photos = FbAlbum.gallery
    render
  end

end