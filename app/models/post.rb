class Post < ApplicationRecord

  belongs_to :user
  def self.reverse_order
    all.reverse
  end

  def posted_at
    created_at.strftime("%H:%M (%d/%m/%y)")
  end
end
