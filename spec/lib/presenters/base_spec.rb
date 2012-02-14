require 'spec_helper'

class DummyPresenter < Presenters::Base
  presents :dummy
end

describe Presenters::Base do
  let(:template) { mock(Object, foo: 'bar', bar: :baz) }
  let(:object) { mock(Object, title: 'Lorem ipsum', content: 'Lorem, lorem ipsum') }

  let(:klass) { DummyPresenter }
  let(:presenter) { klass.new(object, template) }

  it 'should present Dummy (have #dummy method)' do
    presenter.should respond_to(:dummy)
    presenter.dummy.should respond_to(:title, :content)
  end

  it 'should call template with #h method' do
    presenter.send(:h).should == template
  end

  it 'should user method missing and delegate to @template' do
    presenter.foo.should == 'bar'
  end
end