class Album < ApplicationRecord
  belongs_to :user
	
  def posted_at
     created_at.localtime.strftime("%H:%M (%d/%m/%y)")
  end

end
