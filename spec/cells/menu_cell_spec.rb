require 'spec_helper'

describe MenuCell do
  context "cell rendering" do 
    
    context "rendering display" do
      it 'should render menu link to root path' do
        Flatpage.should_receive(:for_menu).and_return [mock_model(Flatpage, title: 'Lorem ipsum')]

        cell = render_cell :menu, :display

        cell.should have_selector 'ul.menu-list li a[href="/"]'
      end

      it 'should render menu link to few flatpages' do
        flatpages = [mock_model(Flatpage, title: 'Lorem'), mock_model(Flatpage, title: 'Ipsum')]
        Flatpage.should_receive(:for_menu).and_return flatpages

        cell = render_cell :menu, :display

        cell.should have_selector 'a[href="/"]'
        cell.should have_selector "a[href='#{flatpage_path(flatpages.last)}']", text: 'Ipsum'
      end
    end
    
  end


  context "cell instance" do 
    subject { cell(:menu) } 
    
    it { should respond_to(:display) }
    
  end
end
