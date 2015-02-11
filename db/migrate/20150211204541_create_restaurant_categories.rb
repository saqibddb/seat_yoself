class CreateRestaurantCategories < ActiveRecord::Migration
  def change
    create_table :restaurant_categories do |t|

      t.timestamps null: false
    end
  end
end
