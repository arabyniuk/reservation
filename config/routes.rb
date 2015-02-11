Reserve::Application.routes.draw do
  root 'application#index'
  resources :tables
  resources :reservations
end
