require 'rails_helper'

RSpec.feature "Like", type: :feature do
  let!(:user) { create(:user) }

  before do
    login(user)
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "users cannot like the same post twice" do
    click_button "Like"
    click_button "Like"
    click_button "Like"
    expect(page.find_by_id('likes')).to have_content("1 Like")
  end
end
