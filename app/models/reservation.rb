class Reservation < ActiveRecord::Base
  validates :time, :party_size, presence: true

  belongs_to :restaurant
  belongs_to :user
end
