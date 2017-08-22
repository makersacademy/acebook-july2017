require 'rails_helper'

RSpec.feature "Like", type: :feature do
  let!(:post) { create(:post, message: "Test post") }

  scenario "page does not change when button like is clicked" do
    visit "/posts"
    click_button "Like"
    expect(current_path).to eq("/posts")
  end
end
