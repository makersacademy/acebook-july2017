require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:post_0) { create(:post) }

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post_id: post_0.id, comment: { message: "Hello, world!", post_id: post_0.id} }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post_id: post_0.id, comment: { message: "Hello, world!", post_id: post_0.id } }
      expect(Comment.find_by(message: "Hello, world!")).to be
    end
  end

end
