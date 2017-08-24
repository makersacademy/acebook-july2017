class Image < ApplicationRecord
  belongs_to :album

  has_attached_file :data

  validates_attachment_content_type :data, :content_type => /\Aimage\/.*\Z/
end
