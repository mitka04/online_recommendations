class MedicalDataIntegrationsController < ActionController::API
    def fetch_and_store_medical_data
        # Fetch medical data using the MedicalDataService.
        medical_data = MedicalDataService.fetch_medical_data

        if medical_data
            # Create a new MedicalDataIntegration record with the fetched data.
            MedicalDataIntegration.create(api_response: medical_data)
            # Respond with a success message if the data was fetched and stored.
            render json: { message: 'Medical data fetched and stored successfully' }
        else
            # Respond with an error message if there was a failure in fetching or storing the data.
            render json: { error: 'Failed to fetch medical data' }, status: :unprocessable_entity
        end
    end
end