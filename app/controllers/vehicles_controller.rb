class VehiclesController < ApplicationController
  def create
    vehicle = Vehicle.new
    vehicle.vehicle_id = vehicle_params[:id]
    
    if !vehicle.save
      render json: vehicle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    vehicle = Vehicle.find_by_vehicle_id(vehicle_params[:id])

    vehicle.destroy if vehicle.present?
  end

private
  def vehicle_params
    params.permit(:id)
  end
end
