require 'spec_helper'

describe Cells::MenuHelper do
  let(:object){ mock_model(Flatpage, title: 'Lorem') }

  it 'should return active link' do
    helper.should_receive(:active_link?).with('/').and_return :active
    helper.menu_link(object, '/').should have_selector 'li.active'
  end

  it 'should return non active link' do
    helper.should_receive(:active_link?).with('/flatpage/1').and_return nil
    helper.menu_link(object, '/flatpage/1').should_not have_selector 'li.active'
  end

  it 'should set proper id' do
    helper.menu_link(object, '/').should have_selector "li#flatpage_#{object.id}"
  end
end