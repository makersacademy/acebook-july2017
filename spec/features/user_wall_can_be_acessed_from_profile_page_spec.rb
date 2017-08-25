require 'rails_helper'

RSpec.feature "The wall", type: :feature do
  let!(:user) { create(:user) }
  let!(:post1) { create(:post) }
  let!(:post2) { create(:post) }

  before do
    login(user)
  end

  scenario 'The wall can be accessed from the profile page' do
    visit(user_path(user))
    click_link('Show wall')
    expect(current_path).to eq (user_wall_index_path(user))
  end

  scenario 'Expect to find only user-related posts on their wall' do
    visit(user_wall_index_path(post1.user))
    expect(page).to have_content(post1.message)
    expect(page).not_to have_content(post2.message)
  end
end
