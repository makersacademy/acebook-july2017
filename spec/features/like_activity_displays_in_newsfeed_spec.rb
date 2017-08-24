require 'rails_helper'
require 'user_helpers'

RSpec.feature "Likings appear in news feed", type: :feature do

  let(:first_name) { "Edward" }
  let(:last_name) { "Withers" }
  let(:post_message) { "I approve this" }

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
    visit news_feed_url
    expect(page).to have_content("#{first_name} #{last_name} liked #{first_name} #{last_name}'s post: #{post_message}")
  end
end
