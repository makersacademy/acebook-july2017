require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "Post" do
    let!(:album) { create(:album) }

    it "GET / responds with 200" do
      redirect_to user_albums_url(album.user)
      expect(response).to have_http_status(200)
    end
  end
end
