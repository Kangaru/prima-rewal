require 'spec_helper'

describe ReservationFormWidget do
  has_widgets do |root|
    root << widget(:reservation_form)
  end

  it "should render :display" do
    widget = render_widget :reservation_form, :display

    widget.should have_selector 'form#new_reservation'

    widget.should have_selector 'input#reservation_full_name'
    widget.should have_selector 'input#reservation_phone_number'
    widget.should have_selector 'input#reservation_email'
    widget.should have_selector 'select#reservation_people'
    widget.should have_selector 'textarea#reservation_notes'
  end
end
