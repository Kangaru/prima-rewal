class FbGraph::PhotoPresenter < ActionPresenter::Base
  presents :photo

  def to_fbgallery_photo
    link_to image_tag(photo.source), photo.source, rel: :fbgallery, class: :thumbnail
  end
end