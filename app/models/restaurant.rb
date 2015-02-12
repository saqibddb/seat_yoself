class Restaurant < ActiveRecord::Base
  validates :name, :address, :city, presence: true

  has_many :reservations
  has_many :users, through: :reservations

  def self.search(search)
    if search
      find('name LIKE ?', "%#{search}%")
    else
      self.all
    end
  end

end
