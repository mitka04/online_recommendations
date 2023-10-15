require 'rails_helper'

RSpec.describe ConsultationRequestsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new consultation request with valid parameters' do
      patient = FactoryBot.create(:patient)
      consultation_request_params = { consultation_request: FactoryBot.attributes_for(:consultation_request, patient_id: patient.id) }

      post :create, params: consultation_request_params

      expect(response).to have_http_status(:created)
      expect(ConsultationRequest.count).to eq(1)
    end

    it 'returns error for invalid consultation request' do
      patient = FactoryBot.create(:patient)
      consultation_request_params = { consultation_request: { text: '', patient_id: patient.id } }

      post :create, params: consultation_request_params

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to include("Text can't be blank")
    end
  end
end



