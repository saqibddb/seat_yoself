class Restaurant < ActiveRecord::Base
  validates :name, :address, :city, presence: true

  has_many :reservations
  has_many :users, through: :reservations

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
