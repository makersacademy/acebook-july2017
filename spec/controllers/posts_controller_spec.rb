require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { User.create(email: "test@test.com", password: "test12") }
  describe "Post" do
    before do
      visit("/users/sign_in")
      fill_in 'user_email', with: "test@test.com"
      fill_in 'user_password', with: "test12"
      click_button 'Log in'
    end

    it "GET /new responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "POST / responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "POST / creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end

    it "GET / responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
