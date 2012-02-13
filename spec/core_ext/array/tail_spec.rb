require 'spec_helper'

describe Array do
  it 'should return tail' do
    [1,2,3].tail.should == [2,3]
    %w{a b c}.tail.should == %w{b c}
  end
end