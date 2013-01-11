module Forms::ReservationHelper
  def reservation_form(object, *args, &block)
    options = args.extract_options!
    args    = args << options.merge(builder: Forms::Builders::Reservation)

    simple_form_for(object, *args, &block)
  end
end