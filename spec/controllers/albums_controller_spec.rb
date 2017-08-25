require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let!(:album_0) { create(:valid_album) }
  let(:params) { { user_id: album_0.user.id, album: album_details } }
  let(:album_details) { { name: "Hello, world!", user_id: album_0.user.id } }

  before do
    sign_in(album_0.user)
  end

  describe "GET" do
    it "GET / responds with 200" do
      redirect_to user_albums_url(album_0.user)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST" do
    it "POST / creates a post" do
      expect{ post :create, params: params }.to change{ Album.count }.by(1)
    end

    it "POST / responds with 200" do
      post :create, params: params
      expect(response).to redirect_to(user_albums_url(album_0.user.id))
    end

  end
end
