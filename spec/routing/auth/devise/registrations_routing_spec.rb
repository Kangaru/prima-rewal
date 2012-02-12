require 'spec_helper'

describe Auth::Devise::RegistrationsController do
  context "#routing" do
    it "should route to #new" do
      get('/users/sign_up').should route_to 'auth/devise/registrations#new'
    end

    it "should route to #create" do
      post('/users').should route_to 'auth/devise/registrations#create'
    end

    it "should route to #edit" do
      get('/users/edit').should route_to 'auth/devise/registrations#edit'
    end

    it 'should route to #update' do
      put('/users').should route_to 'auth/devise/registrations#update'
    end

    it 'should route to #destroy' do
      delete('/users').should route_to 'auth/devise/registrations#destroy'
    end

    it "should route to #cancel" do
      get('/users/cancel').should route_to 'auth/devise/registrations#cancel'
    end
  end
end