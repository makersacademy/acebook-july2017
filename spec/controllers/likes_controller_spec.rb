require 'rails_helper'

RSpec.describe LikesController, type: :controller do


  describe "POST /" do

		let!(:post_mock) {create(:post, message: "A post", id: 1)}
    it "creates a like" do

			post :create, params: { like: { post_id: 1 } }
      expect(Like.find_by(post_id: 1 )).to be
    end
  end

end
