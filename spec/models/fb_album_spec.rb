require 'spec_helper'

describe FbAlbum do
  it 'should fetch for fbgallery' do
    album = mock(FbGraph::Album)

    FbGraph::Album.should_receive(:fetch).with('177381578961541').and_return album
    album.should_receive(:photos)

    FbAlbum.gallery
  end

  it 'should fetch for carousel' do
    album = mock(FbGraph::Album)

    FbGraph::Album.should_receive(:fetch).with('175604345805931').and_return album
    album.should_receive(:photos)

    FbAlbum.carousel
  end
end