require 'rails_helper'
require 'user_helpers'

RSpec.feature "Likings appear in news feed", type: :feature do

  let(:first_name) { "Edward" }
  let(:last_name) { "Withers" }
  let(:post_message) { "I approve this pull request" }

  before do
    sign_up
    visit "/posts"
    within (".new_post") do
      fill_in "post_message", with: post_message
      click_button "Submit"
    end

    click_button "Like"

  end

  scenario "when someone likes something" do
    visit "/news_feed/index"
    expect(page).to have_content("#{first_name} #{last_name} liked #{post_message}")
  end
end
