class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vans
  has_many :bookings

  validates :first_name, :last_name, :first_name, :user_city, :birth_date, presence: true
  #:last_name, :birth_date, :email, :user_city, presence: true
  validates :email, uniqueness: true
end
