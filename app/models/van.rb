class Van < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_global,
    against: [:model, :van_city, :capacity],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :model, :capacity, :van_city, :price_per_day, presence: true
end
