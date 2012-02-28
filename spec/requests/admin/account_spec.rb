require 'spec_helper'

describe 'Admin::AcccountsController' do
  let(:user) { Factory :user }
  before { sign_in user }

  it 'should edit users account and force user to sign in with new credentials' do
    visit edit_admin_account_path user

    new_email, new_password = 'my@email.com', 'password'

    within "form#edit_user_#{user.id}" do
      fill_in 'user_email', with: new_email
      fill_in 'user_password', with: new_password
      fill_in 'user_password_confirmation', with: new_password

      click_button 'Update User'
    end

    current_path.should == new_user_session_path

    within 'form#session_new' do
      fill_in 'user_email', with: new_email
      fill_in 'user_password', with: new_password

      click_button 'Login'
    end

    current_path.should == edit_admin_account_path(user)
  end
end