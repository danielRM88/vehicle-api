require 'rails_helper'

RSpec.describe 'Locations API', type: :request do
  # initialize test data 
  let!(:vehicle) { create(:vehicle) }
  let!(:vehicle_id) { vehicle.vehicle_id }
  let!(:locations) { create_list(:location, 10, { vehicle: vehicle }) }

  describe 'POST /vehicles/:vehicle_id/locations' do
    let(:valid_attributes) { 
      { lat: 52.5, lng: 13.4, at: Time.now } 
    }

    context 'when the request is valid' do
      before { 
        post "/vehicles/#{vehicle_id}/locations", params: valid_attributes
      }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request is invalid' do
      before { 
        post "/vehicles/#{vehicle_id}/locations", params: { 
          id: 'invalid-uuid'
        } 
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

    context 'when the vehicle outside of radius' do
      before { 
        post "/vehicles/#{vehicle_id}/locations", params: { 
          lat: 10, lng: 20, at: Time.now 
        } 
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end