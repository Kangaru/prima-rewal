require 'spec_helper'

describe Flatpage do
  it 'should accept nested attributes for translations' do
    Flatpage.new.should respond_to :translations_attributes=
  end

  it 'should build all available translations' do
    Language.should_receive(:available_locales).and_return [:pl, :en]

    translations = Flatpage.new.translations

    translations.length.should == 2
    translations.map(&:locale).should == [:pl, :en]
  end
end