Rails.application.routes.draw do
  root to: 'pages#front'
  resources :sessions, only: :create
  resources :messages, only: :create
  resources :online_users, only: :index
  get 'sign_out', to: 'sessions#destroy'
  get 'home', to: 'messages#index'
end
