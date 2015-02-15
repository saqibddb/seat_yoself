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

		context "with one reservation of 50 people on a certain date & time" do 
			let!(:reservation) {
				restaurant.reservations.create(:party_size => 90, :date => "2015-2-14", :hour => 18)
			}

			it "should return true if the restaurant isn't full at that time and date" do
				expect(restaurant.available?(10,"2015-2-14", 18)).to eq(true)
			end

			it "should return false if the restaurant is full at that time and date" do
				reservation.update_attribute(:party_size, 50000)

				expect(restaurant.available?(20,"2015-2-14", 18)).to eq(false)
				# expect(record).not_to be_errors?
			end

			it "should return true if the restaurant is full but at a different time but same date" do
				expect(restaurant.available?(20,"2015-2-14", 17)).to eq(true)
			end

			it "should return true if the restaurant is full at that time but a different date(changed day)" do
				expect(restaurant.available?(20,"2015-2-15", 18)).to eq(true)
			end

			it "should return true if the restaurant is full at that time but a different date(changed month)" do
				expect(restaurant.available?(20,"2015-3-14", 18)).to eq(true)
			end

			it "should return true if the restaurant is full at that time but a different date(changed year)" do
				expect(restaurant.available?(20,"2016-2-14", 18)).to eq(true)
			end

		end
	end
end