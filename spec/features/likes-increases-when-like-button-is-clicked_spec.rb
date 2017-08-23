require 'rails_helper'

RSpec.feature "Like", type: :feature do
  let!(:post) { create(:post, message: "Test post", id: 1) }

  let!(:user) { create(:user) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: "test@test.com"
    fill_in 'user_password', with: "test12"
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end

  scenario "number of like increase by 1 when button clicked" do
    visit "/posts"
    click_button "Like"
    expect(page.find_by_id('likes')).to have_content("likes: 1")
  end
end
