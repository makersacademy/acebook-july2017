require 'rails_helper'

<<<<<<< HEAD
feature "user" do
=======
feature "User" do
>>>>>>> cb73a0af60f5d839f6dad7776edcbe1c638e2412
  let(:email) {'user@gmail.com'}
  let(:password) {'123456abc.'}

  scenario "I can sign up" do
    visit('/users/sign_up')
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

<<<<<<< HEAD
  context "/sign_in" do
    let!(:user) { User.create(email: "test@test.com", password: "test12") }

    scenario "After signing out, I'm forwarded to sign in" do
      visit("/users/sign_in")
      fill_in 'user_email', with: "test@test.com"
      fill_in 'user_password', with: "test12"
      within(:css, 'div.actions') do
        click_button 'Log in'
      end
=======
  context "sign in" do
    let!(:user) { User.create(email: "test@test.com", password: "test12") }

    scenario "I can sign in" do
      visit("/users/sign_in")
      fill_in 'user_email', with: "test@test.com"
      fill_in 'user_password', with: "test12"
      click_button 'Log in'
>>>>>>> cb73a0af60f5d839f6dad7776edcbe1c638e2412
      click_link 'Sign out'
      expect(current_path).to eq "/users/sign_in"
    end
  end
end
