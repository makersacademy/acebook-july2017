require 'rails_helper'

RSpec.feature "Like", type: :feature do
let!(:user) { create(:user) }

  before do
    login(user)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "number of like increase by 1 when button clicked" do
    # visit "/posts"
    click_button "Like"
    expect(page.find_by_id('likes')).to have_content("likes: 1")
  end
end
