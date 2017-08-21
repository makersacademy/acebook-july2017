class Post < ApplicationRecord
  def postedat
    self.created_at.strftime("%H:%M (%d/%m/%y)")
  end
end
