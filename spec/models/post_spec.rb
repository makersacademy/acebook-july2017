require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { described_class.new }
  let!(:posts) { create_list(:post, 3)}

  it { is_expected.to be }

  describe "#reverse_order" do
    it "testing post_0" do
      expect(Post.reverse_order).to eq(Post.all.reverse)
    end
  end

  describe "#postedat" do
    it "responds to the #posted_at method" do
      expect(post).to respond_to(:posted_at)
    end
  end
end
