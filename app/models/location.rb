class Location < ApplicationRecord
  OFFICE_LAT = 52.53
  OFFICE_LNG = 13.403
  OFFICE_POINT = [OFFICE_LAT, OFFICE_LNG]

  belongs_to :vehicle

  validates_presence_of :lat
  validates_presence_of :lng
  validates_presence_of :at

  validate :within_radius

  def within_radius
    p1 = [self.lat, self.lng]
    p2 = OFFICE_POINT

    distance = Geocoder::Calculations.distance_between(p1, p2, { units: :km })
    in_circle = distance < 3.5

    if !in_circle
      self.errors.add(:base, "Vehicle outside of accepted radius")
    end
  end
end
