class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vans
  has_many :bookings

  validates :first_name, :last_name, :birth_date, :mail, :user_city, presence: true
  validates :mail, uniqueness: true
end
