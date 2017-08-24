require 'rails_helper'

RSpec.feature "Like", type: :feature do

  let!(:user) { User.create(email: "ladyruby@rails.com", password: "password123") }

  before do
    login
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "users cannot like the same post twice" do
    click_button "Like"
    click_button "Like"
    click_button "Like"
    expect(page.find_by_id('likes')).to have_content("likes: 1")
  end
end
