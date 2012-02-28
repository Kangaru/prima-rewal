require 'spec_helper'

describe FacebookHelper do
  context "#facebook_like_box" do
    it 'should return like box' do
      box = helper.facebook_like_box

      box.should have_selector 'div.box-shadowed #fb-root'
      box.should have_selector 'div.box-shadowed .fb-like-box'

      box.should have_selector 'div.fb-like-box[data-href="http://facebook.com/primarewal"]'
    end
  end
end