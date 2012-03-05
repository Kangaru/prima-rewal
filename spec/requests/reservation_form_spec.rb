require 'spec_helper'

describe 'ReservationForm::Widget' do
  before do
    ActionMailer::Base.deliveries = []

    Factory :flatpage
    visit root_path
  end

  it 'should send email' do
    within 'form#new_reservation' do
      fill_in 'reservation_full_name', with: 'John Doe'
      fill_in 'reservation_phone_number', with: '+48 22 593 393 302'
      fill_in 'reservation_email', with: 'email@mail.com'
      fill_in 'reservation_notes', with: 'Lorem ipsum.'

      click_button 'Book!'
    end


    page.should have_content 'Thank you for the reservation!'
    ActionMailer::Base.deliveries.last.reply_to.should include 'email@mail.com'
  end

  it 'should not send email and show validation errors' do
    click_button 'Book!'

    page.should have_content "First name and surnamecan\\'t be blank"
    page.should have_content "Phone numbercan\\'t be blank"
    page.should have_content "E-mail addresscan\\'t be blank"
    
    ActionMailer::Base.deliveries.should be_empty
  end
end