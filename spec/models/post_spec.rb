require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { described_class.new }
  it { is_expected.to be }

  describe "#postedat" do
    it "responds to the #posted_at method" do
      expect(post).to respond_to(:posted_at)
    end
  end
end
