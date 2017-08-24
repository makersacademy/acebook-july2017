require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  let!(:user) { create(:user) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
    visit "/posts"
  end

  scenario "Can submit posts and view them" do
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can make posts with multpile lines" do
    fill_in "post_message", with: "Hey\r\nWhat's up\r"
    click_button "Submit"
    expect(page).to have_content("Hey\r\nWhat's up\r")
  end
end
