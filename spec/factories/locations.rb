FactoryBot.define do
  factory :location do
    association :vehicle
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    at { Faker::Time.between(10.days.ago, Time.now) }
  end
end