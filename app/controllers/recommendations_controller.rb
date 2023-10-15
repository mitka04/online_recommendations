class RecommendationsController < ActionController::API
    before_action :find_consultation_request
  
    # Create a new recommendation for a specific consultation request.
    def create
        # Build a new recommendation associated with the consultation request.
      @recommendation = @consultation_request.recommendations.build(recommendation_params)
  
      if @recommendation.save
        # If the recommendation is successfully saved, render it as JSON and send an email notification.
        render json: @recommendation, status: :created
        NotificationMailer.new_recommendation_email(@patient, @recommendation)
      else
        # If there are errors, render an error JSON response.
        render json: { error: @recommendation.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # Retrieve and display recommendations for a specific patient.
    def index
      find_patient
      @recommendations = @patient.recommendations
      render json: @recommendations
    end
  
    private
  
    def recommendation_params
        # Define the permitted parameters for a recommendation, including its text.
      params.require(:recommendation).permit(:text)
    end
  
    def find_consultation_request
        # Find the consultation request based on the provided parameter.
      @consultation_request = ConsultationRequest.find(params[:consultation_request_id])
    end
  
    def find_patient
      # Find the patient based on the provided parameter.
      @patient = Patient.find(params[:patient_id])
    end
  end
  
