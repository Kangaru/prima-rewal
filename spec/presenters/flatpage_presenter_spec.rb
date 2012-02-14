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

  context '#form' do
    let(:form) { mock(Object) }
    let(:input) { '<input id="flatpage_title_pl" name="flatpage[title_pl]" type="text"/>' }
    let(:textarea) { '<textarea id="flatpage_content_en" name="flatpage[content_en]" rows="20"></textarea>' }

    it 'should return localized title input' do
      form.should_receive(:input).with(:title_pl, {label: I18n.t('flatpage.title')}).and_return(input)

      presenter.localized_title_input(:pl, form: form).should == input
    end

    it 'should return localized content textarea' do
      form.should_receive(:input).with(:content_en, {as: :text, label: I18n.t('flatpage.content')}).and_return(textarea)

      presenter.localized_content_input(:en, form: form).should == textarea
    end
  end
end