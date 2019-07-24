class LocationsController < ApplicationController
  before_action :find_vehicle

  def create
    location = Location.new location_params
    location.vehicle = @vehicle

    if !location.save
      render json: location.errors, status: :unprocessable_entity
    end
  end

private
  def location_params
    params.permit(:lat, :lng, :at)
  end

  def find_vehicle
    @vehicle = Vehicle.find_by_vehicle_id(params[:vehicle_id])
  end
end
