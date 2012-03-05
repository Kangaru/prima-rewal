require 'spec_helper'

describe Form::Reservation do
  it { should validate_presence_of(:full_name) }
  it { should ensure_length_of(:full_name).is_at_least(3) }
  it { should allow_value('John Doe').for(:full_name) }
  it { should_not allow_value('John').for(:full_name) }
  it { should_not allow_value('Doe').for(:full_name) }

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
end