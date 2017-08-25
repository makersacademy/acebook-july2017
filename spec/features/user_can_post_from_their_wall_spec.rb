require 'rails_helper'

RSpec.feature "The wall", type: :feature do
  let!(:user) { create(:user) }

  before do
    login(user)
  end

  scenario 'The wall can be accessed from the profile page' do
    visit(user_wall_index_path(user))
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("My Wall")
    expect(page).to have_content("Hello, world!")
  end
end
