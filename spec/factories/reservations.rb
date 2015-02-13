FactoryGirl.define do
  factory :reservation do
    party_size {(1..100).to_a.sample}
    time {Time.now.utc}
  end

end
