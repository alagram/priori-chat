Rails.application.routes.draw do
  root to: 'pages#front'
  resources :sessions, only: :create
  get 'sign_out', to: 'sessions#destroy'
  get 'home', to: 'messages#index'
end
