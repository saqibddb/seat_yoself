require 'rails_helper'

describe Restaurant do
	describe "available?" do
		let(:restaurant) {restaurant = Restaurant.create(:name => "Canoe", :capacity => 100, :city => "Toronto", :address => "Toronto")}
		
		it "should return true if there's space" do
			expect(restaurant.available?(10,"2015-2-14", 18)).to eq(true)
		end

		it "should return false if party size is bigger than capacity" do 
			expect(restaurant.available?(200,"2015-2-14", 18)).to eq(false)
		end

		context "with one reservation of 50 people" do 
			let!(:reservation) {Reservation.create(:restaurant => restaurant, :party_size => 50, :date => "2015-2-14", :hour => 18)}


			it "should return true if the restaurant isn't full" do
				expect(restaurant.available?(10,"2015-2-14", 18)).to eq(true)
			end

			it "should return false if the restaurant is full" do
				expect(restaurant.available?(99,"2015-2-14", 18)).to eq(false)
			end
		end
	end
end