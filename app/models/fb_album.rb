class FbAlbum
  def self.gallery
    @fb_gallery ||= FbGraph::Album.fetch('177381578961541').photos
  end

  def self.carousel
    @carousel_album ||= FbGraph::Album.fetch('175604345805931').photos
  end
end