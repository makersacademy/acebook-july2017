require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  describe "POST /" do
		let!(:post1) {create(:post)}

    it "creates a like" do
			post :create, params: { like: { post_id: post1.id }, post_id: post1.id }
      expect(Like.find_by(post_id: post1.id )).to be
    end
  end

end
