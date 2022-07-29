Rails.application.routes.draw do
  # resources :clients
  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'

end
