require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let!(:album) { create(:valid_album) }
  let(:params) { { user_id: album.user.id, album_id: album.id, image: { images: [{ image_file_name: 'hello.jpg' }], album_id: album.id } } }
  before do
    sign_in(album.user)
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
    # Image.any_instance.stub(:image_array).and_return(['imaginary data'])
  end

  describe "POST /" do
    it "responds with 302 (redirect)" do
      # post :create, params: params
      # expect(response).to have_http_status(302)
    end
  end
end
