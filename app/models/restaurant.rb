class Restaurant < ActiveRecord::Base
  validates :name, :address, :city, presence: true

  has_many :reservations
  has_many :users, through: :reservations

  def self.search(search)
    if search
      where("LOWER(name) LIKE ? OR LOWER(cuisine) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
    else
      self.all
    end
  end

  def time_options
    (9..22).map do |hour|
      ampm, twelve_hour = hour.divmod(12)
      twelve_hour = 12 if twelve_hour == 0
      text = "#{twelve_hour} #{ampm == 0 ? "am" : "pm"}"
      [text, hour]
    end
  end

  def available?(party_size, date, hour)
    party_size = party_size.to_i
    hour = hour.to_i
    
    reserved = reservations.where(:hour => hour, :date => date).sum(:party_size)
    availability = capacity - reserved

    p size: party_size, hour: hour, date: date, reserved: reserved, cap: capacity, availability: availability
    
    party_size <= availability
  end




end
