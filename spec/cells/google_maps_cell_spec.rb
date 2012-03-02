require 'spec_helper'

describe GoogleMapsCell do
  context "cell rendering" do 
    
    context "rendering display" do
      subject { render_cell(:google_maps, :display) }
  
      it { should have_selector 'div.google-maps' }
      it { should have_selector 'div.google-maps iframe' }
    end
    
  end


  context "cell instance" do 
    subject { cell(:google_maps) } 
    
    it { should respond_to(:display) }
    
  end
end
