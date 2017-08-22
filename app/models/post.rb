class Post < ApplicationRecord
  include PublicActivity::Model
  tracked # owner: ->(controller,model) {controller && controller.current_user} -->to be implemented after user authentication

  belongs_to :user
  def self.reverse_order
    all.reverse
  end

  def posted_at
    created_at.strftime("%H:%M (%d/%m/%y)")
  end
end
