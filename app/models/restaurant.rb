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

  def available?(party_size, date, hour)
    reserved = reservations.where(:hour => hour).sum(:party_size)
    party_size <= (capacity - reserved)
  end


end
