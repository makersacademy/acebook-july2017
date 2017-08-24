require 'rails_helper'

RSpec.describe Post, type: :model do

  let!(:post) { create(:post) }
  let!(:longpost) { create(:post, message: "a" * 21)}
  let!(:shortpost) { create(:post, message: "a")}
  let!(:posts) { create_list(:post, 3)}

  it { is_expected.to be }

  describe "#reverse_order" do
    it "returns all posts in reverse order" do
      expect(Post.reverse_order).to eq(Post.all.reverse)
    end
  end

  describe "#postedat" do
    it "responds to the #posted_at method" do
      expect(post).to respond_to(:posted_at)
    end
  end

  describe "#summary" do
    it "summarizes messages above a certain length" do
      expect(longpost.summary).to eq("aaaaaaaaaaaaaaaaaaaa...")
    end
    it "doesn't summarize messages below a certain length" do
      expect(shortpost.summary).to eq("a")
    end
  end

  describe "#user_name" do
    it "return the username with first and last name" do
      expect(post.author_full_name).to eq("#{post.user.first_name} #{post.user.last_name}")
    end
  end
end
