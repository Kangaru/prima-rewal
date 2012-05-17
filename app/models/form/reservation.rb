class Form::Reservation
  include ActiveAttr::Model

  def initialize(args = {})
    args = parse_dates(args) if args.present?
    super args
  end

  attribute :full_name
  attribute :phone_number
  attribute :email
  attribute :date_of_arrival, type: Date
  attribute :date_of_departure, type: Date
  attribute :people, type: Integer
  attribute :notes


  validates_presence_of :full_name, :phone_number, :email, :people, :date_of_arrival, :date_of_departure

  validates :full_name, length: { minimum: 3}
  validates :phone_number, length: { maximum: 20 }, format: /\A\+?\d{2,3}[\d -]+\z/i
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :people, inclusion: { in: 1..6 }, numericality: true
  validates :notes, length: { minimum: 3, allow_blank: true }


private

  def parse_dates(attrs)
    attrs.merge({
      date_of_arrival: parse_date(:date_of_arrival, attrs),
      date_of_departure: parse_date(:date_of_departure, attrs)
    })
  end

  def parse_date(name, attrs)
    date_attrs = attrs.values_at("#{name}(1i)", "#{name}(2i)", "#{name}(3i)").compact

    if date_attrs.present?
      Date.parse date_attrs.join('-')
    end
  rescue
    nil
  end
end