require 'spec_helper'

describe Admin::AccountsController do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  context '#index & #show' do
    after do
      response.should redirect_to action: :edit, id: user.id
    end

    it 'should redirect to #edit' do
      get :index
    end

    it 'should redirect to #edit' do
      get :show, id: user.id
    end
  end
end