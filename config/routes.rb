Rails.application.routes.draw do
  get '/auth/oauth2/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  delete '/auth/logout' => 'sessions#destroy'

  resources :messages, only: %i[index show new create edit update]

  root to: "messages#index"
end
