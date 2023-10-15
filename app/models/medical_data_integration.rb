class MedicalDataIntegration < ApplicationRecord
    serialize :api_response, JSON
    validates_presence_of :api_response
end
