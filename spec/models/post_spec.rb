require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:post_0) { create(:post) }
  let!(:post_1) { create(:post) }
  it { is_expected.to be }

  describe "#reverse_order" do
    it "returns all posts in reverse order" do
      expect(Post.reverse_order).to eq(Post.all.reverse)
    end
  end

  describe "#postedat" do
    it "responds to the #posted_at method" do
      expect(post_0).to respond_to(:posted_at)
    end
  end
end
