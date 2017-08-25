require 'rails_helper'

RSpec.feature "News Feed", type: :feature do

  let!(:message) { "a" * 20 + "this should be hidden" }
  let!(:user) { create(:user) }
  let!(:shortpost) { create(:post) }
  let!(:longpost) { create(:post, message: message) }

  before do
    visit "/users/sign_in"
    fill_in 'user_email', with: "test@test.com"
    fill_in 'user_password', with: "test12"
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end

  scenario "Long posts will be summarized on the news feed" do
    visit news_feed_index_url
    expect(page).not_to have_content("this should be hidden")
    expect(page).to have_content("a" * 20 + "...")
  end
end
