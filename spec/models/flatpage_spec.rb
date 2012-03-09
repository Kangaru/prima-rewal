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

    context "#update_position" do
      let(:flatpage) { mock_model(Flatpage) }

      before do
        Flatpage.should_receive(:where).with(id: 2).and_return flatpage
        flatpage.should_receive(:where).with('position != ?', 1).and_return flatpage
        flatpage.should_receive(:limit).with(1).and_return flatpage
      end

      after do
        flatpage.class.send(:update_position, 2, 1)
      end

      it 'should update flatpage' do
        flatpage.should_receive(:first).and_return flatpage
        flatpage.should_receive(:update_attributes).with(position: 1)
      end

      it "should not update flatpage" do
        flatpage.should_receive(:first).and_return nil
        flatpage.should_not_receive(:update_attributes)
      end
    end
  end

  context "#for_main_page" do
    it 'should return flatpage for main page' do
      flatpage = mock_model Flatpage

      Flatpage.should_receive(:order).with('position ASC').and_return flatpage
      flatpage.should_receive(:first).and_return flatpage

      Flatpage.for_main_page
    end
  end

  context "#for_menu" do
    it 'should return sorted flatpages for menu' do
      flatpage = mock_model Flatpage

      Flatpage.should_receive(:order).with('position ASC').and_return flatpage
      flatpage.should_receive(:includes).with(:translations)

      Flatpage.for_menu
    end
  end
end