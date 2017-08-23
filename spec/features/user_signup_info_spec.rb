require 'rails_helper'
require 'user_helpers.rb'

RSpec.feature "user", type: :feature do

  let(:first_name) {'Edward'}
  let(:last_name) {'Withers'}
  let(:date_of_birth) {"1890-08-22 00:00:00"}
  let(:email) {'user@gmail.com'}
  let(:password) {'123456abc.'}
  let(:hometown) {'London'}
  let(:occupation) {'Coach'}
  let(:bio) {"I'm pretty cool and stuff. Now go feed the MonsterCat"}

  scenario "I can input further information about myself on signing up" do
    sign_up(first_name, last_name, email, password, hometown, occupation, bio)
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
