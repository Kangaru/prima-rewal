require 'spec_helper'

describe CarouselCell do
  context "cell rendering" do 
    
    context "rendering display" do
      before do
        album = ['http://img1.pl', 'http://img2.pl']

        FbAlbum.should_receive(:carousel).and_return album
      end

      subject { render_cell(:carousel, :display) }

      it { should have_selector '#myCarousel.carousel.slide' }
      it { should have_selector '#myCarousel.carousel.slide .carousel-inner' }

      it { should have_selector '.carousel-inner .item.active img[src="http://img1.pl"]' }
      it { should have_selector '.carousel-inner .item img[src="http://img2.pl"]' }

      it { should have_selector '.carousel a.left[data-slide="prev"]' }
      it { should have_selector '.carousel a.right[data-slide="next"]' }
    end
    
  end


  context "cell instance" do 
    subject { cell(:carousel) } 
    
    it { should respond_to(:display) }
    
  end
end
