require 'rails_helper'
require 'web_helpers.rb'

feature "Profile page" do

  scenario "user signs up and views profile" do
    sign_up
    # visit("/users/show")
  end

end
