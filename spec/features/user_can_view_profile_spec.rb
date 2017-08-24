require 'rails_helper'
require 'user_helpers.rb'

feature "Profile page" do

  scenario "user signs up and views profile" do
    sign_up
    click_link "My profile"
    expect(page).to have_content('Edward Withers')
  end

end
