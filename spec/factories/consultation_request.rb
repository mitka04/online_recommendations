FactoryBot.define do
    factory :consultation_request do
        text { 'Sample text for consultation request' }
        patient_id { 1 }
    end
end
