class ReservationMailer < ActionMailer::Base
  default from: "no-reply@prima.megiteam.pl"

  def book(reservation)
    @reservation = reservation
    mail to: "prima@prima-rewal.pl", reply_to: @reservation.email, subject: "Rezerwacja (#{@reservation.full_name})"
  end
end
