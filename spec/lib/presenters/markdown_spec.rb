require 'spec_helper'

class DummyClass
  include Presenters::Markdown
end

describe Presenters::Markdown do
  let(:klass) { DummyClass }

  it 'should have #markdown_options accessor' do
    klass.new.private_methods.should include :markdown_options
  end

  it 'should create new markdown object' do
    instance, string, options = klass.new, 'Lorem ipsum', [:filter_html, :autolink]

    instance.should_receive(:markdown_options).and_return options
    Markdown.should_receive(:new).with(string, options).and_return string
    string.should_receive(:to_html).and_return string
    string.should_receive(:html_safe)

    instance.send(:markdown, string)
  end
end