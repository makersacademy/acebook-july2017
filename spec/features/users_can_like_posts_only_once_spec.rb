require 'rails_helper'

RSpec.feature "Like", type: :feature do

let!(:user) { create(:user) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "users cannot like the same post twice" do
    click_button "Like"
    click_button "Like"
    click_button "Like"
    expect(page.find_by_id('likes')).to have_content("likes: 1")
  end
end
