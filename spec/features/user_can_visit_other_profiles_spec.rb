require 'rails_helper'

feature 'visit other profiles' do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  scenario "User can visit other user users profiles" do
    login(user)
    visit "/posts"
    click_on("#{post.user.first_name} #{post.user.last_name}")
    expect(current_path).to eq "/users/#{post.user_id}"
  end
end
