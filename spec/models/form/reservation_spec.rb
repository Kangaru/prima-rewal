require 'spec_helper'
require 'active_attr/rspec'

describe Form::Reservation do
  it { should have_attribute(:date_of_arrival) }
  it { should have_attribute(:date_of_departure) }

  it { should validate_presence_of(:full_name) }
  it { should ensure_length_of(:full_name).is_at_least(3) }

  it { should validate_presence_of(:phone_number) }
  it { should ensure_length_of(:phone_number).is_at_most(20) }
  it { should allow_value('+43 22 493 392 293').for(:phone_number) }
  it { should_not allow_value('i am phone number').for(:phone_number) }

  it { should validate_presence_of(:email) }
  it { should allow_value('email@mail.com').for(:email) }

  it { should validate_presence_of(:people) }
  it { should ensure_inclusion_of(:people).in_range(1..6) }

  it { should ensure_length_of(:notes).is_at_least(3) }
  it { should allow_value(nil).for(:notes) }
  it { should allow_value('').for(:notes) }
  it { should allow_value(' ').for(:notes) }

  context "#parse_date" do
    it 'should parse date_of_arrival properly' do
      params = { :'date_of_arrival(1i)' => 2012, :'date_of_arrival(2i)' => 11, :'date_of_arrival(3i)' => 4 }.with_indifferent_access
      date = Date.new(2012, 11, 4)


      Date.should_receive(:parse).with('2012-11-4').and_return date

      form = Form::Reservation.new(params)
      form.date_of_arrival.should == date
    end

    it 'should parse date_of_departure properly' do
      params = { :'date_of_departure(1i)' => 1992, :'date_of_departure(2i)' => 8, :'date_of_departure(3i)' => 3 }.with_indifferent_access
      date = Date.new(1992, 8, 3)

      Date.should_receive(:parse).with('1992-8-3').and_return date

      form = Form::Reservation.new(params)
      form.date_of_departure.should == date
    end
  end
end