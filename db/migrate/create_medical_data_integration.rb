class CreateMedicalDataIntegration < ActiveRecord::Migration[7.1]
    def change
        create_table :medical_data_integrations do |t|
            t.text :api_response, default: {}.to_json
            t.timestamps
        end
    end
end