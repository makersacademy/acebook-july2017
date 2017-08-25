require 'rails_helper'

RSpec.feature "delete button", type: :feature do
   let!(:post_to_delete) { create(:post) }

  before do
    login(post_to_delete.user)
  end

scenario "comments can be deleted from the list" do
  visit(posts_url)
  p page.body
  click_button("Delete")
  expect(page).not_to have_content(post_to_delete.message)

end

end
