require 'rails_helper'

feature "user" do
  let(:email) {'user@gmail.com'}
  let(:password) {'123456abc.'}
  let(:first_name) {'Edward'}
  let(:last_name) {'Withers'}
  let(:date_of_birth) {"1890-08-22 00:00:00"}
  let(:hometown) {'London'}
  let(:bio) {"I'm pretty cool and stuff. Now go feed the MonsterCat"}



  scenario "I can input further information about myself on signing up" do
    visit('/users/sign_up')
    fill_in 'first_name', with: first_name
    fill_in 'last_name', with: last_name
    fill_in 'date_of_birth', with: date_of_birth
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    fill_in 'hometown', with: hometown
    fill_in 'bio', with: bio
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
