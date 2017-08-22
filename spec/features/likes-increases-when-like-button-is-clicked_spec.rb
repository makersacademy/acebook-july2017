require 'rails_helper'

RSpec.feature "Like", type: :feature do
  let!(:post) { create(:post, message: "Test post", id: 1) }

  scenario "number of like increase by 1 when button clicked" do
    visit "/posts"
    click_button "Like"
    expect(page.find_by_id('likes')).to have_content("likes: 1")
  end
end
