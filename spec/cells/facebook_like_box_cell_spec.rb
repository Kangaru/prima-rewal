require 'spec_helper'

describe FacebookLikeBoxCell do
  context "cell rendering" do 
    
    context "rendering display" do
      subject { render_cell(:facebook_like_box, :display) }

      it { should have_selector 'div.box-shadowed #fb-root' }
      it { should have_selector 'div.box-shadowed .fb-like-box' }
      it { should have_selector 'div.fb-like-box[data-href="http://facebook.com/primarewal"]' }
    end
    
  end


  context "cell instance" do 
    subject { cell(:facebook_like_box) } 
    
    it { should respond_to(:display) }
  end
end
