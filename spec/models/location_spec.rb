require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lng) }
  it { should validate_presence_of(:at) }
end
