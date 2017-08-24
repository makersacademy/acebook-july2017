class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :bio, length: { maximum: 140,
    too_long: "%{count} characters is the maximum allowed" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def format_date_of_birth
    date_of_birth.strftime("%d/%m/%y")
  end

end
