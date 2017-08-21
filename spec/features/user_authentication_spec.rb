require 'rails_helper'

feature "User" do
  let(:email) {'user@gmail.com'}
  let(:password) {'123'}
  scenario "I can sign up with new email and password" do
    visit('/user/new')
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign up'
    expect(page).to have_content('Hello, user@gmail.com')
  end
end
