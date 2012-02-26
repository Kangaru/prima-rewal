require 'spec_helper'

class DummyClass
  include Presenters::Let

  let(:dummy) { 'Hello, I am so dummy...' }
end

describe Presenters::Let do
  let(:klass) { DummyClass }

  it 'should respond to method' do
    klass.new.should respond_to :dummy
  end

  it 'should return value' do
    klass.new.dummy.should == 'Hello, I am so dummy...'
  end
end