require 'rails_helper'

RSpec.describe 'Locations API', type: :request do
  # initialize test data 
  let!(:vehicle) { create(:vehicle) }
  let!(:vehicle_id) { vehicle.vehicle_id }
  let!(:locations) { create_list(:location, 10, { vehicle: vehicle }) }

  describe 'POST /vehicles/:vehicle_id/locations' do
    let(:valid_attributes) { 
      { id: SecureRandom.uuid } 
    }

    context 'when the request is valid' do
      before { 
        post "/vehicles/#{vehicle_id}/locations", params: valid_attributes
      }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
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

      it 'returns a validation failure message' do
        
      end
    end
  end
end