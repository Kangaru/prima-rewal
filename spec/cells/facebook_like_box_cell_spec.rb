require 'spec_helper'

describe FacebookLikeBoxCell do
  context "cell rendering" do

    context "rendering display" do
      subject { render_cell(:facebook_like_box, :display) }

      it { should have_selector '#fb-like-box #fb-root' }
      it { should have_selector '#fb-like-box a[href="http://facebook.com/PrimaRewal"]'}
      it { should have_selector '#fb-like-box .fb-like[data-href="http://facebook.com/PrimaRewal"]' }
      it { should have_selector '#fb-like-box .fb-like[data-layout="button_count"]' }
    end

  end


  context "cell instance" do
    subject { cell(:facebook_like_box) }

    it { should respond_to(:display) }
  end
end
