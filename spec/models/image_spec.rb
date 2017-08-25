require 'rails_helper'

RSpec.describe Image, type: :model do
  before do
    allow_any_instance_of(Paperclip::Attachment).receive(:save).and_return(true)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
