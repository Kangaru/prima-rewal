require 'spec_helper'

describe ContactCell do
  context "cell rendering" do 
    
    context "rendering display" do
      subject { render_cell(:contact, :display) }
  
      it { should have_selector("h1", :content => "Contact#display") }
      it { should have_selector("p", :content => "Find me in app/cells/contact/display.html") }
    end
    
  end


  context "cell instance" do 
    subject { cell(:contact) } 
    
    it { should respond_to(:display) }
    
  end
end
