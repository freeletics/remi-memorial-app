Rails.application.routes.draw do
  # Auth
  get '/auth/oauth2/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  delete '/auth/logout' => 'sessions#destroy'

  # Static pages
  get '/about' => 'pages#about'

  # Messages
  resources :messages do
    collection do
      get :my
    end
  end

  root to: 'messages#index'
end
