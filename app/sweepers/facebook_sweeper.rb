class FacebookSweeper
  class << self
    def expire_gallery_cache!
      Rails.cache.delete 'fbalbum/gallery/photos'
      Rails.cache.delete 'cells/facebook_gallery/display/'
    end

    def expire_carousel_cache!
      Rails.cache.delete 'fbalbum/carousel/photos'
      Rails.cache.delete 'cells/carousel/display/'
    end
  end
end