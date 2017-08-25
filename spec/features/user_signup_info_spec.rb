require 'rails_helper'

RSpec.feature "user", type: :feature do

  scenario "I can input further information about myself on signing up" do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
