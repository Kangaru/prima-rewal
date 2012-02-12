require 'spec_helper'

describe Auth::Devise::PasswordsController do
  context '#routing' do
    it 'should route to #new' do
      get('/users/password/new').should route_to('auth/devise/passwords#new')
    end

    it 'should route to #create' do
      post('/users/password').should route_to('auth/devise/passwords#create')
    end

    it "should route to #edit" do
      get('/users/password/edit').should route_to('auth/devise/passwords#edit')
    end

    it "should route to #update" do
      put('/users/password').should route_to('auth/devise/passwords#update')
    end
  end
end