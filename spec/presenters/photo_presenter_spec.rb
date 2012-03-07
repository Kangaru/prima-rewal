require 'spec_helper'

describe PhotoPresenter do
  let(:photo) { 'http://google.pl/logo.png' }
  let(:presenter) { PhotoPresenter.new(photo, view) }

  it 'should return link to image' do
    photo = presenter.to_fbgallery_photo

    photo.should include 'rel="fbgallery"'
    photo.should include 'src="http://google.pl/logo.png"'
    photo.should include 'href="http://google.pl/logo.png"'
  end
end