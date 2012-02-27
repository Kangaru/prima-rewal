require 'spec_helper'

describe Forms::ReservationHelper do
  context "#input" do
    it 'should add input-medium class' do
      helper.reservation_form :reservation do |f|
        input = extract_tag :input, f.input(:title)
        extract_attr(:class, input).should include 'input-medium'
      end
    end

    it 'should add rows=3 if input is text' do
      helper.reservation_form :reservation do |f|
        input = extract_tag :textarea, f.input(:title, as: :text)
        extract_attr(:rows, input).should == '3'
      end
    end

    it 'should allow to add other input_html attributes' do
      helper.reservation_form :reservation do |f|
        input = extract_tag :input, f.input(:title, input_html: {someattr: :somevalue})
        extract_attr(:someattr, input).should include 'somevalue'
      end
    end

    it 'should set input to optional' do
      helper.reservation_form :reservation do |f|
        input = extract_tag :label, f.input(:title)
        extract_attr(:class, input).should include 'optional'
      end
    end
  end

  context "#button" do
    it 'should add button classes to button' do
      helper.reservation_form :reservation do |f|
        extract_attr(:class, f.button(:submit)).should include 'btn-large btn-primary btn-info'
      end
    end
  end
end