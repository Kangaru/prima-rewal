require 'spec_helper'

describe LanguageChooseCell do
  context "cell rendering" do 
    
    context "rendering display" do
      before { Language.should_receive(:available_locales).and_return [:pl, :en] }
      subject { render_cell(:language_choose, :display) }
  
      it { should have_selector '.language-choose a img[src="/assets/locales/pl.png"]' }
      it { should have_selector '.language-choose a img[src="/assets/locales/en.png"]' }
      it { should_not have_selector '.language-choose a img[src="/assets/locales/de.png"]' }
    end
    
  end


  context "cell instance" do 
    subject { cell(:language_choose) } 
    
    it { should respond_to(:display) }
    
  end
end
