require 'rails_helper'

RSpec.feature "News Feed", type: :feature do

  let!(:message) { "a" * 20 + "this should be hidden" }
  let!(:user) { create(:user) }
  let!(:shortpost) { create(:post) }
  let!(:longpost) { create(:post, message: message) }

  before do
    login(user)
  end

  scenario "Long posts will be summarized on the news feed" do
    visit "/users/#{user.id}/news_feed"
    expect(page).not_to have_content("this should be hidden")
    expect(page).to have_content("a" * 20 + "...")
  end
end
