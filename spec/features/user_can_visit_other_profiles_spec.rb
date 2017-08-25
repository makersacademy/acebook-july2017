require 'rails_helper'

feature 'visit other profiles' do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }



    scenario "User can visit other user users profiles" do
      p user
      p post
      p post.user.first_name
      

    end
end
