class FixStupidDates < ActiveRecord::Migration
  def change
  	remove_column :reservations, :time
  	add_column :reservations, :hour, :integer
  	add_column :reservations, :date, :string
  end
end
