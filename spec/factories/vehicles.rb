FactoryBot.define do
  factory :vehicle do
    vehicle_id { SecureRandom.uuid }
  end
end