require 'spec_helper'

describe 'Admin::UsersController' do
  let(:user) { Factory :user }
  before { sign_in user }

  context "#index" do
    it 'should render #index action and table with users' do
      visit admin_users_path

      within 'table#users' do
        find('td.id').should have_content user.id
        page.should have_content user.email
        page.should have_content I18n.l user.created_at
      end
    end
  end

  context "#new & #create" do
    it 'should create new user' do
      visit new_admin_user_path

      email, password = 'new_user@mail.com', 'passwd'

      within 'form#new_user' do
        fill_in 'user_email', with: email
        fill_in 'user_password', with: password
        fill_in 'user_password_confirmation', with: password

        click_button 'Create User'
      end

      current_path.should == admin_users_path
      User.exists?(email: email).should be_true
    end
  end

  context '#destroy' do
    it 'should destroy user' do
      user_to_delete = Factory :user

      visit admin_users_path

      find("tr#user_#{user_to_delete.id} a.delete_link").click

      current_path.should == admin_users_path
      User.exists?(email: user_to_delete).should be_false
    end
  end
end