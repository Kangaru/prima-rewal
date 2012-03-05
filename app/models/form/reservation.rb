class Form::Reservation
  include ActiveAttr::Model

  attribute :full_name
  attribute :phone_number
  attribute :email
  attribute :people, type: Integer
  attribute :notes


  validates_presence_of :full_name, :phone_number, :email, :people

  validates :full_name, length: { minimum: 3}, format: /\A[A-Z][a-z]+ [A-Z][a-z]+\z/i
  validates :phone_number, length: { maximum: 20 }, format: /\A\+?\d{2,3} [\d -]+\z/i
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :people, inclusion: { in: 1..6 }, numericality: true
  validates :notes, length: { minimum: 3, allow_blank: true }
end