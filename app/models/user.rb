class User < ApplicationRecord
  has_many :posts
  has_many :albums
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :bio, length: { maximum: 140,
    too_long: "%{count} characters is the maximum allowed" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
   
  def format_date_of_birth
    date_of_birth.strftime("%d/%m/%y")
  end
end
