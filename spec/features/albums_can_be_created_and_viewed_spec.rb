require 'rails_helper'

feature 'Album' do
  let!(:test_album_name) { 'My days at Makers' }
  let!(:album) { create(:album) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: album.user.email
    fill_in 'user_password', with: album.user.password
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end

  scenario 'View albums' do
    click_link 'My albums'
    expect(page).to have_content(album.name)
  end

  scenario 'Create album' do
    click_link 'My albums'
    click_link 'New album'
    fill_in 'album_name', with: test_album_name
    click_button 'Create'
    expect(page).to have_content(test_album_name)
  end
end
