require 'spec_helper'

class DummyController
  def self.before_filter(*args)
    nil
  end

  def cookies
    {}
  end

  def params
    {i18n_locale: I18n.locale}
  end

  include LocalizedController
end

describe LocalizedController do
  let(:klass) { DummyController }

  it 'should set locale to params[:i18n_locale]' do
    instance = klass.new

    I18n.should_receive(:locale=).with(:pl).and_return I18n.default_locale
    instance.stub(:params).and_return({i18n_locale: :pl})

    instance.set_locale
  end

  it 'should return default_url_options' do
    I18n.should_receive(:locale).and_return :de
    klass.new.default_url_options.should == { i18n_locale: :de }
  end
end