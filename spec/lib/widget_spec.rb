require 'spec_helper'

describe Widget do
  context "#accessors" do
    subject { Widget.new(:content, :context) }

    it { should respond_to :content }
    it { should respond_to :context }
    it { should respond_to :widgets }

    context "#class accessors" do
      subject { Widget }

      it { should respond_to :widgets }
    end
  end

  context "#instance_variables" do
    it 'should get class accessor #widgets and pass to instance accessor' do
      widgets = { carousel: :cell, googlemaps: :widget }

      Widget.should_receive(:widgets).and_return widgets

      instance = Widget.new :content, :context
      instance.widgets.should == widgets
    end
  end

  context "#mathing" do
    subject { Widget.new 'Lorem ipsum [[ fblikebox ]], dolor.', mock(Object) }
    let(:klass) { subject.class }

    it 'should yield block for every matching widget' do
      subject.stub(:widgets).and_return({ fblikebox: :cell })
      subject.context.should_receive(:render_cell).with(:fblikebox, :display).and_return 'I rendered cell!1'

      subject.send(:matching) do |type, name|
        subject.context.send(type, name, :display)
      end.should == 'Lorem ipsum I rendered cell!1, dolor.'
    end

    it 'should do nothing if match non existing widget' do
      subject.stub(:widgets).and_return({ contact: :widget })

      subject.send(:matching) do |type, name|
      end.should == 'Lorem ipsum fblikebox, dolor.'
    end
  end

  context "#widgetize" do
    subject { Widget.new 'Lorem ipsum [[ carousel ]], dolor.', mock(Object) }

    it 'should send message to view context' do
      subject.stub(:widgets).and_return({carousel: :widget})
      subject.context.should_receive(:render_widget).with(:carousel, :display).and_return 'I am widget'

      content = subject.widgetize

      content.should include 'I am widget'
    end
  end
end