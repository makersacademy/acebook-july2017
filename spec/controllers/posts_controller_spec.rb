require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Post" do
    let!(:user) { create(:user) }
    let!(:post_0) { create(:post) }
    let(:delete_params) { { post: post_0, id: post_0.id } }

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

    it "DELETE / responds with 302" do
      delete :destroy, params: delete_params
      expect(response).to have_http_status(302)
    end

    it "DELETE / deletes a post" do
      expect{ delete :destroy, params: delete_params }.to change{ Post.count }.by(-1)
    end
  end
end
