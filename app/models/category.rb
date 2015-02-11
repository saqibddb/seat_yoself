class Category < ActiveRecord::Base
  validates :type, presence: true

  has_many :restaurants, through: :restaurantCategories
end