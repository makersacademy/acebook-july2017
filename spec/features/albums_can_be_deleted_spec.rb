require 'rails_helper'

feature 'Album' do
  let!(:album) { create(:album) }
  let!(:user) { create(:user) }

  before do
    login(user)
  end

  scenario 'Albums can be deleted' do
    click_link 'My albums'
		click_link 'Delete album'
		expect(page).not_to have_content(album.name)
		expect(page).not_to have_content(album.description)
  end
end
