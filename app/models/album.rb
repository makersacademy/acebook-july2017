class Album < ApplicationRecord
  belongs_to :user
  has_many :images

  def posted_at
     created_at.localtime.strftime("%H:%M (%d/%m/%y)")
  end

end
