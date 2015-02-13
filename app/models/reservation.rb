class Reservation < ActiveRecord::Base
  validates :date, :hour, :party_size, presence: true

  belongs_to :restaurant
  belongs_to :user
end
