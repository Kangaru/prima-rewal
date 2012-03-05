require 'spec_helper'

describe FacebookGalleryCell do
  context "cell rendering" do

    context "rendering display" do
      before do
        album = [
          mock(FbGraph::Photo, source: 'http://img1.pl', class: 'FbGraph::Photo'),
          mock(FbGraph::Photo, source: 'http://img2.pl', class: 'FbGraph::Photo'),
          mock(FbGraph::Photo, source: 'http://img3.pl', class: 'FbGraph::Photo')
        ]

        FbAlbum.should_receive(:gallery).and_return album
      end

      subject { render_cell(:facebook_gallery, :display) }

      it { should have_selector '#fbgallery li.span6 img[src="http://img1.pl"]' }
      it { should have_selector '#fbgallery li.span2 img[src="http://img2.pl"]' }
      it { should have_selector '#fbgallery li.span2 img[src="http://img3.pl"]' }
    end

  end


  context "cell instance" do
    subject { cell(:facebook_gallery) }

    it { should respond_to(:display) }
  end
end
