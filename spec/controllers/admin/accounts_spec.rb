require 'spec_helper'

describe Admin::AccountsController do
  let(:user) { mock_model(User) }

  before do
    controller.should_receive(:current_user).and_return user
    controller.should_receive(:authenticate_user!).and_return true
  end

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