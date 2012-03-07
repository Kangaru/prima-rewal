require 'spec_helper'

describe ContactCell do
  context "cell rendering" do 
    
    context "rendering display" do
      subject { render_cell(:contact, :display) }
    end
    
  end


  context "cell instance" do 
    subject { cell(:contact) } 
    
    it { should respond_to(:display) }
    
  end
end
