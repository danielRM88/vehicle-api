require 'rails_helper'

RSpec.describe 'Vehicles API', type: :request do
  # initialize test data 
  let!(:vehicles) { create_list(:vehicle, 10) }
  let(:vehicle_id) { vehicles.first.vehicle_id }

  describe 'POST /vehicles' do
    let(:valid_attributes) { 
      { id: SecureRandom.uuid } 
    }

    context 'when the request is valid' do
      before { 
        post "/vehicles", params: valid_attributes
      }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request is invalid' do
      before { 
        post "/vehicles", params: { 
            id: 'invalid-uuid'
          } 
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /vehicles/:id' do
    before { delete "/vehicles/#{vehicle_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end