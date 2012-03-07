require 'spec_helper'

describe FacebookSweeper do
  it 'shoud expire gallery cache' do
    Rails.cache.should_receive(:delete).with('fbalbum/gallery/photos')
    Rails.cache.should_receive(:delete).with('cells/facebook_gallery/display/')

    FacebookSweeper.expire_gallery_cache!
  end

  it 'should expire carousel cache' do
    Rails.cache.should_receive(:delete).with('fbalbum/carousel/photos')
    Rails.cache.should_receive(:delete).with('cells/carousel/display/')

    FacebookSweeper.expire_carousel_cache!
  end
end