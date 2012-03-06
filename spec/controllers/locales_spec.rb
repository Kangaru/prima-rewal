require 'spec_helper'

describe LocalesController do
  after(:all) do
    I18n.locale = I18n.default_locale
  end

  it 'should set params[:i18n_locale]' do
    put :update, i18n_locale: 'pl'
    cookies[:i18n_locale].should == 'pl'
  end

  it 'should set locale do default locale' do
    I18n.should_receive(:default_locale).exactly(3).times.and_return('fr') # some rails stuff here? o.O
    put :update
    cookies[:i18n_locale].should == 'fr'
  end

  it 'should redirect to root path' do
    put :update, i18n_locale: 'nl'
    response.should redirect_to root_path(i18n_locale: 'nl')
  end

  it 'should redirect to flatpage path' do
    flatpage = mock_model(Flatpage)
    Flatpage.should_receive(:find).with('10-lorem-ipsum').and_return flatpage

    put :update, i18n_locale: 'pt', slug: '10-lorem-ipsum'
    response.should redirect_to flatpage_path(flatpage)
  end
end