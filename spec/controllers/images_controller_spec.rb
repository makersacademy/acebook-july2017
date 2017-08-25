require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  before do
    allow_any_instance_of(Paperclip::Attachment).receive(:save).and_return(true)
  end
end
