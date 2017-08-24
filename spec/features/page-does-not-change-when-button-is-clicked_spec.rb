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

  scenario "page does not change when button like is clicked" do
    visit "/posts"
    click_button "Like"
    expect(current_path).to eq("/posts")
  end
end
