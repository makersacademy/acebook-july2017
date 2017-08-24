require 'rails_helper'

RSpec.feature "Like", type: :feature do
  let!(:user) { User.create(email: "test@test.com", password: "test12") }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: "test@test.com"
    fill_in 'user_password', with: "test12"
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
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
