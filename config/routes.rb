Rails.application.routes.draw do
  
  resources :consultation_requests, only: [:create]

  resources :consultation_requests, only: [] do
    resources :recommendations, only: [:create]
  end

  resources :patients do
    resources :recommendations, only: [:index]
  end

  post '/medical_data_integrations', to: 'medical_data_integrations#fetch_and_store_medical_data'

end

