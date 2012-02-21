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
      Language.available_locales.each do |locale|
        flatpage = flatpage locale

        within "div#lang-#{locale}" do
          fill_in "Title", with: flatpage.title
          fill_in "Content", with: flatpage.content
        end
      end

      click_button 'Create Flatpage'
      flatpage =  Flatpage.first

      current_path.should == admin_flatpage_path(flatpage)

      Language.available_locales.each do |locale|
        flatpage.send(:"title_#{locale}").should == "Lorem ipsum #{locale}"
      end
    end
  end

  context '#edit & #update' do
    let(:flatpage) { Factory :flatpage }
    before { visit edit_admin_flatpage_path flatpage }

    it 'should update flatpage' do
      Language.available_locales.each_with_index do |locale|
        within "div#lang-#{locale}" do
          fill_in "Title", with: "New title #{locale}"
          fill_in "Content", with: "New content #{locale}"
        end
      end

      click_button 'Update Flatpage'
      flatpage = Flatpage.first

      current_path.should == admin_flatpage_path(flatpage)

      Language.available_locales.each do |locale|
        flatpage.send(:"title_#{locale}").should == "New title #{locale}"
        flatpage.send(:"content_#{locale}").should == "New content #{locale}"
      end
    end
  end
end