require 'spec_helper'

describe FbGraph::PhotoPresenter do
  let(:photo) { mock(Object, source: 'http://google.pl/logo.png') }
  let(:presenter) { FbGraph::PhotoPresenter.new(photo, view) }

  it 'should return link to image' do
    photo = presenter.to_fbgallery_photo

    photo.should include 'rel="fbgallery"'
    photo.should include 'src="http://google.pl/logo.png"'
    photo.should include 'href="http://google.pl/logo.png"'
  end
end