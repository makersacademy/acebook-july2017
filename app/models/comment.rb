class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  MAX_SUMMARY_LENGTH = 20

  include PublicActivity::Model
  tracked

  def summary
    return message unless message.length > MAX_SUMMARY_LENGTH
    message[0...MAX_SUMMARY_LENGTH] + "..."
  end
end
