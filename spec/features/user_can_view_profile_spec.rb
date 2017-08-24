require 'rails_helper'
require 'user_helpers.rb'

feature "Profile page" do

  scenario "user signs up and views profile" do
    sign_up
    click_link "My profile"
    expect(page).to have_content('Edward Withers')
    expect(page).to have_content('01/05/85')
    expect(page).to have_content('London')
    expect(page).to have_content('Coach')
    expect(page).to have_content("I'm pretty cool and stuff. Now go feed the MonsterCat")
  end
end
