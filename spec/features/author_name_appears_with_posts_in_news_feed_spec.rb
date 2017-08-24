require 'rails_helper'
require 'user_helpers'

RSpec.feature "Username with posts in news feed", type: :feature do
  let(:first_name) { "Ed" }
  let(:last_name) { "Withers" }

  before do
    sign_up(first_name: first_name, last_name: last_name)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "when posts appear in the news feed" do
    visit "/news_feed/index"
    expect(page).to have_content("#{first_name} #{last_name}")
  end
end
