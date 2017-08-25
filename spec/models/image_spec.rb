require 'rails_helper'

RSpec.describe Image, type: :model do
  let!(:image) { create(:image) }
  before do
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
  end
  it "creates a new image" do
    expect(image).to be_valid
  end
end
