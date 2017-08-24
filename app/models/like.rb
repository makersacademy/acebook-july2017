class Like < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :post
  belongs_to :user
  validates :user, uniqueness: {scope: :post_id}
end
