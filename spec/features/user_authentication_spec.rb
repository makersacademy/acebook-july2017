require 'rails_helper'

feature "User" do
  let(:email) {'user@gmail.com'}
  let(:password) {'123456abc.'}

  scenario "I can sign up with new email and password" do
    visit('/users/sign_up')
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Sign up'
    expect(page).to have_content('Hello, user@gmail.com')
  end
end
