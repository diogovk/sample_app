require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', text: 'Sample App') }
    it { should have_title("Ruby on Rails Tutorial Sample App") }
    it { should_not have_title('| Home') }
  end

  shared_examples_for "non-home static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title("Ruby on Rails Tutorial Sample App | #{page_title}") }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "non-home static pages"
  end

  describe "About page" do
    before { visit about_path }

    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "non-home static pages"
  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "non-home static pages"
  end

  it "should have the correct links in the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_selector('h1', text: "About Us")
    click_link "Contact"
    expect(page).to have_selector('h1', text: "Contact")
    click_link "Help"
    expect(page).to have_selector('h1', text: "Help")
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_selector('h1', text: "Sign up")
    click_link "sample app"
    expect(page).to have_selector('h1', text: "Sample App")
  end

end
