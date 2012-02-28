require 'spec_helper'

describe FacebookHelper do
  context "#facebook_like_box" do
    it 'should return like box' do
      #OpenStruct.should_receive(:new).with(href: "http://www.facebook.com/primarewal", width:  840, height: 185, faces: true, stream: false, header: false, color:  '#ffffff')
      box = helper.facebook_like_box

      box.should have_selector 'div.container'
      box.should have_selector 'div#fb-root'
      box.should have_selector 'div.fb-like-box[data-href="http://facebook.com/primarewal"]'
    end
  end
end