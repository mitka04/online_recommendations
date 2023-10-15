class CreateMedicalDataIntegrations < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_data_integrations do |t|

      t.timestamps
    end
  end
end
