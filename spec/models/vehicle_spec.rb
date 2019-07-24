require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { should validate_presence_of(:vehicle_id) }
end
