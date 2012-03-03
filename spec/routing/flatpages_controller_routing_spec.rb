require 'spec_helper'

describe FlatpagesController do
  context "#routing" do

    it 'should route to #index (root path)' do
      get('/').should route_to 'flatpages#index'
    end

    it "should route to localized root path" do
      get('/en').should route_to 'flatpages#index', i18n_locale: 'en'
      get('/pl').should route_to 'flatpages#index', i18n_locale: 'pl'
      get('/de').should route_to 'flatpages#index', i18n_locale: 'de'
    end

    it 'should route to localized #show' do
      get('/en/page/1').should route_to   'flatpages#show', id: "1", i18n_locale: 'en'
      get('/pl/strona/1').should route_to 'flatpages#show', id: "1", i18n_locale: 'pl'
      get('/de/seite/1').should route_to  'flatpages#show', id: "1", i18n_locale: 'de'
    end

  end
end