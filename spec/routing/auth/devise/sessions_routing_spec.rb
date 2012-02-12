require 'spec_helper'

describe Auth::Devise::SessionsController do
  context '#routing' do
    it 'should route to #new' do
      get('/users/sign_in').should route_to 'auth/devise/sessions#new'
    end

    it 'should route to #create' do
      post('/users/sign_in').should route_to 'auth/devise/sessions#create'
    end

    it 'should route to #destroy' do
      delete('/users/sign_out').should route_to 'auth/devise/sessions#destroy'
    end
  end
end