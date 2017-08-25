require 'rails_helper'

RSpec.feature "User", type: :feature do
  let!(:user) { create(:user) }

  scenario "I can sign up" do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  context "/sign_in" do
  scenario "After signing out, I'm forwarded to sign in" do
    sign_up
    click_on'Sign out'
    expect(current_path).to eq "/users/sign_in"
  end
  end
end
