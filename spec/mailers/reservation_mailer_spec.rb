require "spec_helper"

attrs = { full_name: 'John Doe', phone_number: '+41 33 323 302 392', email: 'mail@mail.com', people: 1, notes: '' }

describe ReservationMailer do
  describe "book" do
    let(:reservation) { mock_model(Form::Reservation, attrs) }
    let(:mail) { ReservationMailer.book(reservation) }

    it "renders the headers" do
      mail.subject.should == 'Rezerwacja (John Doe)'
    end

    it "renders the body" do
      body = mail.body.encoded
      body.should include "John Doe"
      body.should include '<b>Uwagi</b>: Brak'
    end

    it 'renders the body with notes' do
      reservation = mock_model(Form::Reservation, attrs.merge(notes: 'I have a cat'))
      mail = ReservationMailer.book(reservation)

      body = mail.body.encoded

      body.should include '<b>Uwagi</b>: I have a cat'
    end
  end

end
