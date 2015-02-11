class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :address
      t.string :city
      t.string :phone_number
      t.string :name
      t.string :menu_url
      t.string :picture_url

      t.timestamps null: false
    end
  end
end
