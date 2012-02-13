require 'spec_helper'

describe 'Admin::Flatpages' do
  let(:user) { Factory :user }
  before { sign_in user }

  context '#index & #show' do
    let!(:flatpage) { Factory :flatpage }

    it 'should render #index action and table with flatpages' do
      visit admin_flatpages_path

      within 'table#flatpages' do
        page.should have_content flatpage.title
        page.should have_content I18n.l flatpage.created_at
      end
    end

    it 'should render #show' do
      visit admin_flatpage_path(flatpage)

      within "div#attributes_table_flatpage_#{flatpage.id}" do
        page.should have_content flatpage.title

        Language.all.each do |locale, _|
          page.should have_content flatpage.send(:"content_#{locale}")
        end
      end
    end
  end

  context '#new & #create' do
    before { visit new_admin_flatpage_path }

    it 'should show #new page with jQuery-UI tabs', js: true do
      find('div#lang-pl').should be_visible

      Language.available_locales.tail.each do |locale|
        tab, link = find("div#lang-#{locale}"), find("a[href='#lang-#{locale}']")

        tab.should_not be_visible
        link.click
        tab.should be_visible
      end
    end

    it 'should create new flatpage' do
      Language.all.each do |locale, _|
        expected = flatpage(locale)

        within "div#lang-#{locale}" do
          fill_in "flatpage_title_#{locale}", with: expected.title
          fill_in "flatpage_content_#{locale}", with: expected.content
        end
      end

      click_button 'Create Flatpage'
      flatpage =  Flatpage.first

      current_path.should == admin_flatpage_path(flatpage)

      Language.all.each do |locale, _|
        flatpage.send(:"title_#{locale}").should == "Lorem ipsum #{locale}"
      end
    end
  end
end