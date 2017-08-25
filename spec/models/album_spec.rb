require 'rails_helper'

RSpec.describe Album, type: :model do
  let!(:valid_album) { build(:valid_album) }
  let!(:invalid_album) { build(:invalid_album) }

  it "should be valid" do
    expect(valid_album).to be_valid
  end
  it "user ID should be present"  do
    expect(invalid_album).not_to be_valid
  end
end
