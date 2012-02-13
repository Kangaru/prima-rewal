require 'spec_helper'

describe Language do
  let(:lang) { Language }

  it 'should return all available locales' do
    lang.available_locales.should == [:pl, :en, :de]
  end

  it 'should return translated locale' do
    lang.translate_locale(:pl).should == 'Polish'
  end

  it 'should return hash with translated locales' do
    expected = { pl: 'Polish', en: 'English', de: 'German' }
    lang.all.should == expected
  end

  it 'should return default locale' do
    lang.default_locale.should == :pl
  end
end