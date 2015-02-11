class Restaurant < ActiveRecord::Base
  validates :name, :address, :city, :menu_url, presence: true

  has_many :reservations
  has_many :users, through: :reservations
  has_many :categories, through: :restaurantCategories
end
