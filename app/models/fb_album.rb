class FbAlbum
  @albums = {
    gallery:  177381578961541,
    carousel: 175604345805931
  }

  class << self
    attr_reader :albums
  end

  albums.each do |album, id|
    define_singleton_method album do
      fetch_photos album, id
    end
  end

private
  # Fetch photos from cache or from given Facebook album
  #
  # @param album      [Symbol]
  # @param separator  [String]
  #
  # @return [Array]
  def self.fetch_photos(album, id)
    photos = lambda { FbGraph::Album.fetch(id).photos.map(&:source) }
    return photos.call unless ActionController::Base.perform_caching

    Rails.cache.fetch(cache_name album) { photos.call }
  end

  def self.cache_name(album)
    "fbalbum/#{album}/photos"
  end
end