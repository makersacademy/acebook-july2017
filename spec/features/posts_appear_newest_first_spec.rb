require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  let!(:user) { create(:user) }
  let!(:post_0) { create(:post) }
  let!(:post_1) { create(:post) }

  before do
    login(user)
  end

  scenario "created posts appear newest first" do
    visit "/posts"
    expect(post_1.message).to appear_before(post_0.message)
  end
end
