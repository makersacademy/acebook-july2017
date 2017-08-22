require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  let!(:user) { User.create(email: "test@test.com", password: "test12") }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: "test@test.com"
    fill_in 'user_password', with: "test12"
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
    visit "/posts"
    click_link "New post"
  end

  scenario "Can submit posts and view them" do
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can make posts with multpile lines" do
    fill_in "Message", with: "Hey\r\nWhat's up\r"
    click_button "Submit"
    expect(page).to have_content("Hey\r\nWhat's up\r")
  end
end
