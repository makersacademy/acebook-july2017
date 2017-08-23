class Post < ApplicationRecord
   belongs_to :user
  
  include PublicActivity::Model
  tracked # owner: ->(controller,model) {controller && controller.current_user} -->to be implemented after user authentication

  MAX_SUMMARY_LENGTH = 20
  
  def self.reverse_order
    all.reverse
  end

  def posted_at
    created_at.strftime("%H:%M (%d/%m/%y)")
  end

  def summary
    return message unless message.length > MAX_SUMMARY_LENGTH
    message[0...MAX_SUMMARY_LENGTH] + "..."
  end
end
