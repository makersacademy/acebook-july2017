require 'rails_helper'

RSpec.describe LikesController, type: :controller do


  describe "POST /" do
    # it "responds with 200" do
    #   post :create, params: { like: { post_id: 1 } }
    #   expect(response).to redirect_to(posts_url)
    # end

		let(:post) {create(:post, message: "A post")}
    it "creates a like" do
			# likes = Like.all
			# Post.likes.build()

			like = Like.new(post_id: post.id, created_at: "2017-08-22 11:46:38.097751", updated_at: "2017-08-22 11:46:38.097751")
			p like.validate
			p like.errors
			p post_mock
			# post :create, params: { like: { post_id: 1 } }
			p Like.all
      expect(Like.find_by(post_id: 1 )).to be
    end
  end

end
