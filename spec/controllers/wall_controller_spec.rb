require 'rails_helper'

RSpec.describe WallController, type: :controller do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {user_id: user.id}
      expect(response).to have_http_status(:success)
    end
  end
end
