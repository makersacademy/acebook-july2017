require 'rails_helper'

feature 'Album' do
  let!(:test_album_name) { 'My days at Makers' }
  let!(:test_album_description) { "My adventures in testing" }
  let!(:album) { create(:album) }

  before do
    visit("/users/sign_in")
    fill_in 'user_email', with: album.user.email
    fill_in 'user_password', with: album.user.password
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end

  scenario 'Albums can be created' do
    click_link 'My albums'
    expect(page).to have_content(album.name)
  end

  scenario 'Album names, descriptions and dates of creation appear on the albums page' do
    click_link 'My albums'
    click_link 'New album'
    fill_in 'album_name', with: test_album_name
    fill_in 'album_description', with: test_album_description
    click_button 'Create'
    album = Album.find_by(name: test_album_name)
    expect(page).to have_content(test_album_name)
    expect(page).to have_content(album.created_at.localtime.strftime("%H:%M (%d/%m/%y)"))
    expect(page).to have_content("My adventures in testing")
  end
end
