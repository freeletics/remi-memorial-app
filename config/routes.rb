Rails.application.routes.draw do
  resources :messages, only: %i[index show new create edit update]

  root to: "messages#index"
end
