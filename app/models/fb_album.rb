class FbAlbum
  def self.gallery
    fetch_photos(:gallery, 177381578961541)
  end

  def self.carousel
    fetch_photos(:carousel, 175604345805931)
  end


private

  # Fetch photos from cache or from given Facebook album
  #
  # @param cache_name [Symbol]
  # @param album_id   [Integer]
  # @param separator  [String]
  #
  # @return [Array]
  def self.fetch_photos(cache_name, album_id, separator = '||')
    Rails.cache.fetch("fbalbum/#{cache_name}/photos") do
      FbGraph::Album.fetch(album_id).photos.map(&:source)
    end
  end
end