class Restaurant < ActiveRecord::Base
  validates :name, :address, :city, presence: true

  has_many :reservations
  has_many :users, through: :reservations
  has_many :categories, through: :restaurantCategories
end
