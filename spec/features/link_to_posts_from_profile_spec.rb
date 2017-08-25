require 'rails_helper'

feature "Add link to posts" do
  let!(:user) { create(:user) }

  before do
    login(user)
  end

  scenario "profile page has a link to posts" do
    visit user_path(user)
    click_link "Show posts"
    expect(current_path).to eq posts_path
  end
end
