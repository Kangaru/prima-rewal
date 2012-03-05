class FbAlbum
  def self.gallery
    FbGraph::Album.fetch('177381578961541').photos
  end

  def self.carousel
    FbGraph::Album.fetch('175604345805931').photos
  end
end