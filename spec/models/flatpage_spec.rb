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

  context '#update_positions' do
    it 'should call #update_position for all ids' do
      Flatpage.should_receive(:update_position).with(4, 1)
      Flatpage.should_receive(:update_position).with(5, 2)
      Flatpage.should_receive(:update_position).with(6, 3)

      Flatpage.update_positions [4, 5, 6]
    end

    it 'should create update sql query with proper informations' do
      flatpage = mock_model(Flatpage)

      Flatpage.should_receive(:where).with('id == ? AND position != ?', 2, 1).and_return flatpage
      flatpage.should_receive(:limit).with(1).and_return flatpage
      flatpage.should_receive(:update_all).with({position: 1})

      flatpage.class.send(:update_position, 2, 1)
    end
  end
end