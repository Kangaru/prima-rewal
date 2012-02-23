require 'spec_helper'

describe FlatpagePresenter do
  let(:flatpage) { mock_model(Flatpage, created_at: Time.now) }
  let(:presenter) { FlatpagePresenter.new(flatpage, view) }

  it 'should return localized #created_at' do
    presenter.created_at.should == I18n.l(flatpage.created_at)
  end

  it 'should return all titles' do
    translations = [mock(Object, title: 'Lorem'), mock(Object, title: 'Ipsum')]
    flatpage.should_receive(:translations).and_return(translations)

    presenter.titles.should == 'Lorem/Ipsum'
  end

  it 'should return all languages that flatpage is translated to' do
    Language.should_receive(:translate_locale).with('pl').and_return('PL')
    Language.should_receive(:translate_locale).with('en').and_return('EN')

    translations = [mock(Object, locale: 'pl'), mock(Object, locale: 'en')]
    flatpage.should_receive(:translations).and_return(translations)

    presenter.translated_to.should == 'PL/EN'
  end

  it 'should return link to tab' do
    expected = '<li><a href="#lang-pl">Polish</a></li>'

    presenter.admin_form_tab(:pl, 'Polish').should == expected
  end

  it 'should return span with titles to be sortable' do
    flatpage.should_receive(:id).and_return 1
    presenter.should_receive(:titles)

    sortable_titles = presenter.sortable_titles

    sortable_titles.should include 'data-id="1"'
    sortable_titles.should include 'class="sortable_title"'
  end
end