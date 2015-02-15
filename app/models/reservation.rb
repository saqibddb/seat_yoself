class Reservation < ActiveRecord::Base
  validates :date, :hour, :party_size, presence: true

  validate :has_enough_seats

  def has_enough_seats
  	errors.add(:party_size, "is too big")
  end

  belongs_to :restaurant
  belongs_to :user

  # def availability
  # 	if restaurant.available?(party_size, date, hour)
  # 		errors.add(:base, "Restaurant is full at this time")
  # 	end
  # end

end
