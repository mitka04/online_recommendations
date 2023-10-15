class MedicalDataService
    MOCK_API_URL = 'https://api.example.com/medical_data'.freeze

    def self.fetch_medical_data
        response = HTTParty.get(MOCK_API_URL)
        JSON.parse(response.body)
    rescue StandardError => e
        Rails.logger.error("Error fetching medical data: #{e.message}")
        nil
    end
end