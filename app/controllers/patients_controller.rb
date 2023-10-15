class PatientsController < ApplicationController
    def recommendations
        # Find the patient by their ID provided in the request parameters.
        patient = Patient.find(params[:patient_id])

        # Retrieve recommendations for the patient by mapping over their consultation requests.
        recommendations = patient.consultation_requests.map { |request| request.recommendations }
    
        # Render a JSON response with the recommendations and a success status.
        render json: recommendations, status: :ok
      end
    end
