class Location < ApplicationRecord
  belongs_to :vehicle

  validates_presence_of :lat
  validates_presence_of :lng
  validates_presence_of :at
end
