require 'rails_helper'

RSpec.feature "Show Date", type: :feature do

  let!(:user) { create(:user) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end

  scenario "Newly created posts show the date they were posted" do
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    post = Post.find_by(message: "Hello, world!")
    expect(page).to have_content(post.created_at.localtime.strftime("%H:%M (%d/%m/%y)"))
  end
end
