require 'spec_helper'

describe Forms::ReservationHelper do
  context "#input" do
    it 'should add input-medium class' do
      helper.reservation_form :reservation do |f|
        input = f.input :title
        input.should have_selector 'input.input-medium'
      end
    end

    it 'should add rows=3 if input is text' do
      helper.reservation_form :reservation do |f|
        input = f.input :body, as: :text
        input.should have_selector 'textarea[rows="3"]'
      end
    end

    it 'should allow to add other input_html attributes' do
      helper.reservation_form :reservation do |f|
        input = f.input :title, input_html: { someattr: :somevalue }
        input.should have_selector 'input[someattr="somevalue"]'
      end
    end

    it 'should set input to optional' do
      helper.reservation_form :reservation do |f|
        f.input(:title).should have_selector 'label.optional'
        f.input(:title, as: :text).should have_selector 'label.optional'
      end
    end
  end

  context "#button" do
    it 'should add button classes to button' do
      helper.reservation_form :reservation do |f|
        input = f.button :submit
        input.should have_selector 'input.btn-large.btn-primary.btn-info'
      end
    end
  end
end