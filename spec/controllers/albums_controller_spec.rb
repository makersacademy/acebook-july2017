require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
	describe "Post" do
    let!(:user) { create(:user) }

    before do
      sign_in(user)
    end

    it "POST / creates an album" do
			post :create, params: { album: { name: "Makers", description: "My time at Makers", user_id: user.id }, user_id: user.id, current_user: user }
      expect(Album.find_by(name: "Makers")).to be
    end

    it "GET / responds with 200" do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(200)
    end

		context 'An album exists' do
			let!(:album) {create(:album)}
			it "DESTROY / destroys an album" do
				delete :destroy, params: { user_id: user.id, id: album.id }
				expect(Album.find_by(name: "Makers")).not_to be
			end
		end

  end
end
