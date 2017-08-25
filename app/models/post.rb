class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  include PublicActivity::Model
  tracked # owner: ->(controller,model) {controller && controller.current_user} -->to be implemented after user authentication

  has_many :comments

  MAX_SUMMARY_LENGTH = 20

  def self.reverse_order
    all.reverse
  end

	def posted_at
    created_at.localtime.strftime("%H:%M (%d/%m/%y)")
  end

  def summary
    return message unless message.length > MAX_SUMMARY_LENGTH
    message[0...MAX_SUMMARY_LENGTH] + "..."
  end

  def user_name
    "#{user.user_name}"
  end

  def like
    "Like".pluralize(likes.count)
  end

  def like_count
    likes.count
  end

end
