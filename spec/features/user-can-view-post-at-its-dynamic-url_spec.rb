require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, message: "First post", id: 1) }

  before do
    login(user)
  end

  scenario "can view a single post" do
    visit post_path(post)
    expect(page).to have_content("First post")
  end
end
