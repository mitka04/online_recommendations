class ConsultationRequestsController < ActionController::API
    def create
        # Create a new ConsultationRequest object with the provided parameters.
        @consultation_request = ConsultationRequest.new(consultation_request_params)
                
        # Try to save the new consultation request to the database.
        if @consultation_request.save
          # If successful, render a JSON response with the created consultation request.
          render json: { consultation_request: @consultation_request }, status: :created
        else
          # If there are errors, render a JSON response with the error messages.
          render json: { error: @consultation_request.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def consultation_request_params
        # Define the permitted parameters for a consultation request, including patient_id and text.
        params.require(:consultation_request).permit(:patient_id, :text)
      end
end