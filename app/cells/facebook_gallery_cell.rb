class FacebookGalleryCell < Cell::Rails
  include ActionPresenter::ViewHelper

  def display
    @cover, *@photos = FbAlbum.gallery
    render
  end

end