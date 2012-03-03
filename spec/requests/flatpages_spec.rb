require 'spec_helper'

describe 'FlatpagesController' do
  context "#index" do
    let!(:flatpage) { Factory :flatpage }
    before { visit root_path }

    it 'should show flatpage' do
      within 'article' do
        page.should have_content flatpage.content
      end
    end

  end

  context "#show" do
    let!(:flatpage) { Factory :flatpage }
    before { visit flatpage_path flatpage }

    it "should show flatpage" do
      within 'article' do
        page.should have_content flatpage.content
      end
    end
  end
end