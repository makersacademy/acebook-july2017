require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  let!(:user) { create(:user) }
  let!(:post_0) { create(:post, message: "First post", user_id: user.id) }
  let!(:post_1) { create(:post, message: "Second post", user_id: user.id) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: "test@test.com"
    fill_in 'user_password', with: "test12"
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end

  scenario "created posts appear newest first" do
    visit "/posts"
    expect(post_1.message).to appear_before(post_0.message)
  end
end
