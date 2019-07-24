FactoryBot.define do
  factory :location do
    association :vehicle
    lat { 52.5 }
    lng { 13.403 }
    at { Faker::Time.between(10.days.ago, Time.now) }
  end
end