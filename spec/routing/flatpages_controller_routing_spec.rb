require 'spec_helper'

describe FlatpagesController do
  context "#routing" do

    it 'should route to #index (root path)' do
      get('/').should route_to 'flatpages#index'
    end

    it 'should route to #show' do
      get('/flatpages/1').should route_to 'flatpages#show', id: "1"
    end

  end
end