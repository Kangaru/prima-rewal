require 'spec_helper'

describe Array do
  context "#select_qt_than" do
    it 'should select if method is :count' do
      el1, el2, el3 = mock(Object, count: 5), mock(Object, count: 2), mock(Object, count: 55)
      arr = [el1, el2, el3]

      arr.select_qt_than(2, :count).should == [el1, el3]
    end

    it 'should select if method is :self' do
      arr = [5, 2, 55]

      arr.select_qt_than(2).should == [5, 55]
    end

    it 'should return empty array if all elements are less than `n`' do
      arr = [1,2,3]

      arr.select_qt_than(3).should == []
    end
  end

  context "#select_lt_than" do
    it 'should select if method is :count' do
      el1, el2, el3 = mock(Object, count: 5), mock(Object, count: 2), mock(Object, count: 55)
      arr = [el1, el2, el3]

      arr.select_lt_than(55, :count).should == [el1, el2]
    end

    it 'should select if method is :self' do
      arr = [5, 2, 55]

      arr.select_lt_than(55).should == [5, 2]
    end

    it 'should return empty array if all elements are less than `n`' do
      arr = [10, 20, 30]

      arr.select_lt_than(10).should == []
    end
  end

  context "#select_with_sign" do
    it 'should raise exception if other sign than :> or :< is passed' do
      select = lambda { [1,2,3].send(:select_with_sign, 0, :self, :+) }

      select.should raise_exception 'Incorrect sign. Must be :>, :< or :=='
    end

    it 'should return empty array if self is empty' do
      [].send(:select_with_sign).should == []
    end
  end
end