require 'rails_helper'
require 'user_helpers.rb'

feature "user" do

  scenario "I can sign up" do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  context "/sign_in" do
    let!(:user) { User.create(email: "test@test.com", password: "test12") }

    scenario "After signing out, I'm forwarded to sign in" do
      visit("/users/sign_in")
      fill_in 'user_email', with: 'user@gmail.com'
      fill_in 'user_password', with: '123456abc.'
      within(:css, 'div.actions') do
        click_button 'Log in'
      end
      click_link 'Sign out'
      expect(current_path).to eq "/users/sign_in"
    end
  end
end
