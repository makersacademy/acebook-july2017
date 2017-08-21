require 'rails_helper'

RSpec.feature "Date Posted", type: :feature do
  scenario "Newly created posts show the date they were posted" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    post = Post.find_by(message: "Hello, world!")
    expect(page).to have_content(post.created_at.strftime("%H:%M (%d/%m/%y)"))
  end
end
