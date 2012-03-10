class ReservationMailer < ActionMailer::Base
  default from: "no-reply@prima.megiteam.pl"

  def book(reservation)
    @reservation = reservation
    mail to: "zlw.zalewski@gmail.com", reply_to: @reservation.email, subject: "Rezerwacja (#{@reservation.full_name})"
  end
end
