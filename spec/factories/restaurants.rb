FactoryGirl.define do
  factory :restaurant do
		name { "Test Restaurant"}
		address {"a"}
		city {"a"}
		capacity {(50..200).to_a.sample}

		factory :restaurant_with_reservations do
			transient do
				num_reservations 3
			end

			after_create do |object, variables|
				transients.num_reservations.each do
					FactoryGirl.create(:reservation, :restaurant => object)
				end
			end
		end

  end

end
