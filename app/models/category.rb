class Category < ActiveRecord::Base
  validates :cuisine, presence: true

  has_many :restaurantCategories
  has_many :restaurants, through: :restaurantCategories
end