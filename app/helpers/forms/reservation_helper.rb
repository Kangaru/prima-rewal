module Forms::ReservationHelper
  def reservation_form(object, *args, &block)
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(builder: Forms::Builders::Reservation)), &block)
  end
end