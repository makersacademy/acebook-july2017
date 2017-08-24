require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Post" do
    let!(:user) { create(:user) }

    before do
      sign_in(user)
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
