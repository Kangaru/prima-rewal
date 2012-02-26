require 'spec_helper'

describe FlatpagesController do
  context "#index & #show" do
    let(:flatpage) { mock_model(Flatpage, id: 42) }

    after do
      assigns[:flatpage].should == flatpage
      response.should render_template 'show'
    end

    it 'should call flatpage for main page and render #show view' do
      Flatpage.should_receive(:for_main_page).and_return flatpage

      get :index
    end

    it 'should find flatpage by id and render #show view' do
      Flatpage.should_receive(:find).with("42").and_return flatpage

      get :show, id: 42
    end
  end
end