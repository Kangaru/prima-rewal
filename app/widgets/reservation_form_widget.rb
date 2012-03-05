class ReservationFormWidget < Apotomo::Widget
  helper Forms::ReservationHelper

  responds_to_event :submit, with: :process_reservation
  responds_to_event :send_reservation, with: :send_reservation

  def display
    @reservation = Form::Reservation.new
    render
  end

  def process_reservation(event)
    @reservation = Form::Reservation.new(event[:reservation])

    if @reservation.valid?
      trigger :send_reservation, reservation: @reservation
      replace state: :display
    else
      replace view: :display
    end
  end

  def send_reservation(event)
    @reservation = event[:reservation]
    ReservationMailer.book(@reservation).deliver

    render text: "$('body').prepend('#{escape_js render}');"
  end

end
