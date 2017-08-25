require 'rails_helper'

RSpec.feature "Newsfeed link in navbar", type: :feature do
  before do
    sign_up
  end

  scenario "on any page" do
    click_link "A C E B O O K"
    expect(current_path).to eq("/news_feed/index")
  end

end
