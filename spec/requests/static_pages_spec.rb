require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
    it "should have right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby | Home")
    end
  end
  describe "Help Page" do
    it "should have right title" do
      visit '/static_pages/help'
      expect(page).to have_title("Ruby | Help")
    end
    it "should have 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
  describe "About Page" do
    it "should have right title" do
      visit '/static_pages/about'
      expect(page).to have_title("Ruby | About")
    end
    it "shoud have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
    
  end
end
