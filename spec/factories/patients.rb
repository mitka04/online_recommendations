FactoryBot.define do
    factory :patient do
      name { 'John Doe' }
      date_of_birth { '1990-01-01' }
      phone_number { '123-456-7890' }
      email { 'john@example.com' }
    end
  end
  