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

  def available?(party_size, time)
    # reserved = reservations.where(:time => reservation_at(params[:time]))sum(:party_size)
    party_size <= (capacity - reserved)
  end

  # def reservations_at(time)
  #   time(5i) = 0 #minutes
  #   reservations.where(["time >= ? and time < ?", start, start + 1.hour])
  # end

end
