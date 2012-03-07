require 'spec_helper'

describe FbAlbum do
  before(:all) { ActionController::Base.perform_caching = true }
  after(:all) { ActionController::Base.perform_caching = false }

  before { ActionController::Base.cache_store.clear }


  it 'should fetch gallery from facebook' do
    album, photos = mock(FbGraph::Album), [mock(FbGraph::Photo), mock(FbGraph::Photo)]

    FbGraph::Album.should_receive(:fetch).with(177381578961541).and_return album
    album.should_receive(:photos).and_return photos
    photos.should_receive(:map)

    FbAlbum.gallery
  end

  it 'should fetch gallery from cache' do
    Rails.cache.should_receive(:fetch).with('fbalbum/gallery/photos').and_return ['photo1', 'photo2']
    FbAlbum.gallery.should == ['photo1', 'photo2']
  end

  it 'should fetch carousel from facebook' do
    album, photos = mock(FbGraph::Album), [mock(FbGraph::Photo), mock(FbGraph::Photo)]

    FbGraph::Album.should_receive(:fetch).with(175604345805931).and_return album
    album.should_receive(:photos).and_return photos
    photos.should_receive(:map)

    FbAlbum.carousel
  end

  it 'should fetch carousel from cache' do
    Rails.cache.should_receive(:fetch).with('fbalbum/carousel/photos').and_return ['photo1', 'photo2']
    FbAlbum.carousel.should == ['photo1', 'photo2']
  end
end