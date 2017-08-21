class Post < ApplicationRecord
  def posted_at
    created_at.strftime("%H:%M (%d/%m/%y)")
  end
end
