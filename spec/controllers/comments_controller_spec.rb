require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:post_0) { create(:post) }
  let(:params) { { post_id: post_0.id, comment: comment } }
  let(:comment) { { message: "Hello, world!",
                  post_id: post_0.id,
                  user_id: post_0.user.id } }

  describe "POST /" do
    it "responds with 200" do
      post :create, params: params
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      expect{ post :create, params: params }.to change{ Comment.count }.by(1)
    end
  end

end
