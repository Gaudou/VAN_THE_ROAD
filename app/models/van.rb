class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :model, :capacity, :van_city, :price_per_day, presence: true
end
