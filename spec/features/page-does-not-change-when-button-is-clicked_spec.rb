require 'rails_helper'

RSpec.feature "Like", type: :feature do
  let!(:user) { create(:user) }

  before do
    login(user)
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "page does not change when button like is clicked" do
    visit "/posts"
    click_button "Like"
    expect(current_path).to eq("/posts")
  end
end
