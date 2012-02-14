require 'spec_helper'

class StringPresenter < Presenters::Base
  def foobar
    'foo'
  end
end

class OtherPresenter < StringPresenter
  def foobar
    'bar'
  end
end

describe PresenterHelper do
  it 'should call default presenter if presenter class is not given' do
    helper.present('foobar') do |p|
      p.foobar
    end.should == 'foo'
  end

  it 'should call given presenter class' do
    helper.present('foobar', OtherPresenter) do |p|
      p.foobar
    end.should == 'bar'
  end

  it 'should return nil if no block is given' do
    helper.present('foobar').should be_nil
  end
end