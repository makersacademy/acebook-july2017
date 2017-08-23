require 'rails_helper'

RSpec.feature "added comments", type: :feature do
  let!(:user) { create(:user) }
  let!(:first_post) { create(:post) }
  let!(:second_post) { create(:post) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end

  scenario "created comment to appear on post" do
    visit "/posts"
    within('#post-' + second_post.id.to_s) do
      fill_in "comment_message", with: "this is a comment"
      click_button "Submit"
    end
    expect(page).to have_content "this is a comment"
    expect(second_post.message).to appear_before("this is a comment")
    expect("this is a comment").to appear_before(first_post.message)
  end
end
