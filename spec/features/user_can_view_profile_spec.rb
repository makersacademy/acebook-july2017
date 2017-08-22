require 'rails_helper'
require 'web_helpers.rb'

feature "Profile page" do

  scenario "user signs up and views profile" do
    sign_up
    click_link "My profile"
    expect(page).to have_content('Lady Ruby')
  end

end
