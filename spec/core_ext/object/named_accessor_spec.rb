require 'spec_helper'

class DummyClass
  def initialize(dummy_attr)
    @dummy_attr = dummy_attr
  end

  named_accessor :dummy_attr, as: :more_dummy
end

describe Object do
  let(:dummy_class) { DummyClass.new('foobar') }

  it 'should respond to named accessor' do
    dummy_class.should respond_to(:more_dummy)
  end

  it 'should return instance variable' do
    dummy_class.more_dummy.should == 'foobar'
  end
end